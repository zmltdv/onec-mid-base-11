//zmltdv: Основная процедура для отрисовки новых элементов формы
Процедура ОтрисоватьНовыеЭлементы(Форма) Экспорт

	ИмяФормы = Форма.ИмяФормы;
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
		ДобавитьПолеСогласованнаяСкидка(Форма);
	ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);  
	ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);
	КонецЕсли;
	
КонецПроцедуры

//zmltdv: Процедура для добавления поля "КонтактноеЛицо" в группу "ГруппаШапкаПраво" формы
Процедура ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма)
	
	ПолеВвода = Форма.Элементы.Добавить("КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.из_КонтактноеЛицо";
	
КонецПроцедуры

//zmltdv: Процедура для вставки поля "КонтактноеЛицо" перед элементом "СуммаДокумента" формы
Процедура ДобавитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма)
	
	ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), , Форма.Элементы.СуммаДокумента);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.из_КонтактноеЛицо";
	
КонецПроцедуры

//zmltdv: Процедура для добавления поля "СогласованнаяСкидка" с дополнительными элементами управления
Процедура ДобавитьПолеСогласованнаяСкидка(Форма)
	
	Группа = Форма.Элементы.Добавить("Скидка", Тип("ГруппаФормы"), Форма.Элементы.ГруппаШапкаЛево);
	Группа.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	Группа.Отображение = ОтображениеОбычнойГруппы.Нет;
	Группа.ОтображатьЗаголовок = Истина;
	Группа.Заголовок = "Скидка";
	
	ПолеВвода = Форма.Элементы.Добавить("СогласованнаяСкидка", Тип("ПолеФормы"), Группа);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.из_СогласованнаяСкидка";
	ПолеВвода.УстановитьДействие("ПриИзменении", "СогласованнаяСкидкаПриИзменении"); 
	
	Команда = Форма.Команды.Добавить("ПрименитьСкидку");
	Команда.Заголовок = "Применить и пересчитать";
	Команда.Действие = "ПрименитьСкидку";
	
	КнопкаФормы = Форма.Элементы.Добавить("ПрименитьСкидку", Тип("КнопкаФормы"), Группа);
	КнопкаФормы.ИмяКоманды = "ПрименитьСкидку";
	КнопкаФормы.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
	
КонецПроцедуры
