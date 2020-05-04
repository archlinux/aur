# For Pocketbook SDK (libwine)

CC = winegcc
CXX = wineg++
CC_FLAGS = -I/usr/local/pocketbook/include -I/usr/include/freetype2 -Wall -fomit-frame-pointer -fpermissive -Wno-narrowing -O2 -mwindows -m32
LD_FLAGS = -L/usr/local/pocketbook/lib -lfreetype -lz -ljpeg -linkview

EXECUTABLE = inkdemo
EXECUTABLE_SO = $(EXECUTABLE).exe.so
EXECUTABLE_EXE = $(EXECUTABLE).exe

SOURCES += /usr/local/pocketbook/sources/grays/inkdemo.c

all: exe

exe: $(SOURCES)
	$(CXX) $(SOURCES)  $(CC_FLAGS) $(LD_FLAGS) -o $(EXECUTABLE)

run: exe
	WINEARCH=win32 WINEPREFIX=$(HOME)/.wine32 wine $(EXECUTABLE_SO)

run-strace: exe
	WINEARCH=win32 WINEPREFIX=$(HOME)/.wine32 strace wine $(EXECUTABLE_SO)

clean:
	rm $(EXECUTABLE_SO) || true
	rm $(EXECUTABLE_EXE) || true
