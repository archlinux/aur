CC = gcc
CFLAGS = -g -Wall --std=c99
OBJECTS = main.o web.o parse.o portfolio.o
LIBS = -lcurl
BINS = getcrypt
DESTDIR = /usr

$(BINS): $(OBJECTS)
	$(CC) $(CFLAGS) $(LIBS) -o $(BINS) $(OBJECTS)
install: $(BINS)
	install -Dm755 $(BINS) $(DESTDIR)/bin/
uninstall: $(BINS)
	-rm $(DESTDIR)/bin/$(BINS)
clean:
	-rm $(BINS) $(OBJECTS)
.PHONY: install uninstall