CC = gcc
CFLAGS = -g -Wall --std=c99
OBJECTS = main.o web.o parse.o portfolio.o
LIBS = -lcurl
BINS = getcrypt
DESTDIR = /usr

$(BINS): $(OBJECTS)
	$(CC) $(CFLAGS) $(LIBS) -o $(BINS) $(OBJECTS)
	gzip $(BINS).1
install: $(BINS)
	install -Dm755 $(BINS) $(DESTDIR)/bin/
	install -Dm644 $(BINS).1.gz $(DESTDIR)/share/man/man1
uninstall: $(BINS)
	-rm $(DESTDIR)/bin/$(BINS)
clean:
	-rm $(BINS) $(OBJECTS)
	-gunzip $(BINS).1.gz
pkgclean:
	-rm -r $(BINS) pkg/ src/ *.xz
.PHONY: install uninstall