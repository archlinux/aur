CC = gcc
CFLAGS = -g -Wall --std=c99
OBJECTS = main.o api.o portfolio.o
LIBS = -lcurl -ljson-c
BIN = tick
DESTDIR = /usr

$(BIN): $(OBJECTS)
	$(CC) $(CFLAGS) $(LIBS) -o $(BIN) $(OBJECTS)
	-gzip $(BIN).1
install: $(BIN)
	install -Dm755 $(BIN) $(DESTDIR)/bin/$(BIN)
	install -Dm644 LICENSE $(DESTDIR)/share/licenses/$(BIN)/LICENSE
	install -Dm644 $(BIN).1.gz $(DESTDIR)/share/man/man1/$(BIN).1.gz
uninstall:
	-rm $(DESTDIR)/bin/$(BIN)
	-rm $(DESTDIR)/share/licenses/$(BIN)/LICENSE
	-rm $(DESTDIR)/share/man/man1/$(BIN).1.gz
clean:
	-rm $(BIN) $(OBJECTS)
	-gunzip $(BIN).1.gz
pkgclean:
	-rm -r $(BIN) pkg/ src/ *.xz
.PHONY: install uninstall
