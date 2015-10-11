
all:
	@echo run '`make install`'

install:
	cp translateselection /usr/bin/
	cp select-and-translate.khotkeys /usr/share/khotkeys/

clean:

arch:
	makepkg -f

arch-clean: clean
	rm -rf pkg/ src/ 
	rm -f kde-select-and-translate-*.pkg.tar.xz
	rm -f kde-select-and-translate-*.tar.gz