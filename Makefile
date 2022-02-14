all: srcinfo rebuild

srcinfo: .SRCINFO

install: rebuild
	sudo pacman -U "$$(awk -F= '{k[$$1]=$$2}END{print k["pkgname"]"-"k["pkgver"]"-"k["pkgrel"]}' PKGBUILD)"-*.pkg.*

rebuild: src
	makepkg -ef

clean:
	rm -f -- *.pkg.*
	rm -rf -- pkg

distclean: clean
	rm -f -- .SRCINFO
	rm -rf -- src

src: PKGBUILD
	makepkg -o

# src needed here to update pkgver
.SRCINFO: PKGBUILD src
	makepkg --printsrcinfo > $@

.PHONY: all rebuild install clean distclean srcinfo
