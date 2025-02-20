QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    dataresult.cpp \
    main.cpp \
    script.cpp \
    tableshow.cpp \
    widget.cpp

HEADERS += \
    dataresult.h \
    script.h \
    tableshow.h \
    widget.h

FORMS += \
    dataresult.ui \
    tableshow.ui \
    widget.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    csvgen/csv_generate.py \
    csvgen/peoples.csv \
    test_files/csv_generate.py \
    test_files/peoples.csv
