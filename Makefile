CFLAGS 		= -Wall -Wextra -Wpedantic -g
BINDIR		= /usr/local

aurmor: main.o buffer.o operation.o memory.o list.o rpc.o
	gcc -o aurmor main.c buffer.c operation.c \
		memory.c list.c rpc.c -lcurl -ljson-c

main.o: main.c operation.h memory.h \
		rpc.h list.h buffer.h
	gcc -c main.c

buffer.o: buffer.c buffer.h memory.h
	gcc -c buffer.c

operation.o: operation.c operation.h memory.h \
		buffer.h list.h rpc.h
	gcc -c operation.c

list.o: list.c list.h memory.h buffer.h
	gcc -c list.c

memory.o: memory.c memory.h list.h rpc.h
	gcc -c memory.c

rpc.o: rpc.c rpc.h memory.h list.h \
		buffer.h
	gcc -c rpc.c

.PHONY: install clean uninstall
install:
	install -m 0755 aurmor $(BINDIR)/bin/

clean:
	rm aurmor main.o buffer.o operation.o list.o memory.o \
		rpc.o

uninstall:
	rm $(BINDIR)/bin/aurmor
