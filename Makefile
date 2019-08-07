CC	= gcc
CFLAGS	= -Wno-unused-paraneter -DWLR_USE_UNSTABLE -DWL_HIDE_DEPRECATED -Iinclude -I/usr/include/pixman-1
LDFLAGS	= -lwlroots -lwayland-server -lpixman-1
BINARY	= waybox_binary
PKGNAME	= waybox
PREFIX	= /usr
BINDIR	= $(PREFIX)/bin

all: waybox/main.o waybox/server.o waybox/cursor.o waybox/output.o
	$(CC) $(CFLAGS) $(LDFLAGS) waybox/*.o -o $(BINARY)

waybox/main.o: waybox/main.c
	$(CC) $(CFLAGS) -c waybox/main.c -o waybox/main.o

waybox/server.o: waybox/server.c
	$(CC) $(CFLAGS) -c waybox/server.c -o waybox/server.o

waybox/cursor.o: waybox/cursor.c
	$(CC) $(CFLAGS) -c waybox/cursor.c -o waybox/cursor.o

waybox/output.o: waybox/output.c
	$(CC) $(CFLAGS) -c waybox/output.c -o waybox/output.o 

clean:
	rm waybox/*.o $(BINARY) || true

install: all
	install -m 755 $(BINARY) $(BINDIR)/$(PKGNAME)

uninstall:
	rm $(BINDIR)/$(PKGNAME) || true
