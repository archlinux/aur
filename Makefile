ifndef OS

C = gcc
CFLAGS = -Wall -Wextra -O2 -lm -lreadline --std=c99
ifeq ($(shell uname -s), Darwin)
CFLAGS += -I/usr/local/opt/readline/include -L/usr/local/opt/readline/lib
else
CFLAGS += -s -no-pie
endif

CBITS = $(shell getconf LONG_BIT)

BUILD__ = $(C) clibasic.c $(CFLAGS) -DB$(CBITS) -o clibasic && chmod +x ./clibasic
BUILD32 = $(C) clibasic.c -m32 $(CFLAGS) -DB32 -o clibasic && chmod +x ./clibasic

INSTALL_TO = "/usr/bin/clibasic"

INSTALL = sudo rm -f $(INSTALL_TO); sudo cp ./clibasic $(INSTALL_TO)

all: clean build run

all32: clean build32 run

build:
	$(BUILD__)

build32:
	$(BUILD32)

update:
	printf "\\e[0m\\e[31;1mAre you sure? [y/N]: "; read -n 1 I; [ ! "$$I" == "" ] && printf "\\e[0m\\n" &&\
([[ ! "$$I" =~ ^[^Yy]$$ ]] && sh -c 'git restore . && git pull' &> /dev/null && chmod +x *.sh) || exit 0

install:
	if [ ! -f ./clibasic ]; then $(BUILD__); fi
	$(INSTALL)

install32:
	if [ ! -f ./clibasic ]; then $(BUILD32); fi
	$(INSTALL)

run:
	./clibasic

debug:
	./clibasic --debug

clean:
	rm -f ./clibasic

else

C = gcc

CFLAGS = -Wall -Wextra -O2 -Ilib -s -lm -lreadline --std=c99

BUILD64 = xcopy lib\win64\*.dll . /Y && $(C) clibasic.c -m64 $(CFLAGS) -Llib\win64 -DB64 -o clibasic.exe
BUILD32 = xcopy lib\win32\*.dll . /Y && $(C) clibasic.c -m32 $(CFLAGS) -Llib\win32 -DB32 -o clibasic.exe

all: clean build run

all32: clean build32 run

build:
	$(BUILD64)

build32:
	$(BUILD32)

update:
	git restore . & git pull

run:
	.\clibasic.exe

debug:
	.\clibasic.exe --debug

clean:
	del /q /f .\clibasic.exe

endif
