PREFIX = /usr

colorpicker: main.c
	cc -o colorpicker main.c `pkg-config --libs --cflags x11`

install: colorpicker
	mkdir -p $(DESTDIR)$(PREFIX)/bin/
	cp -f colorpicker $(DESTDIR)$(PREFIX)/bin/

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/colorpicker

clean:
	rm -f colorpicker

.PHONY: clean install uninstall
