all: srcinfo rebuild

srcinfo: .SRCINFO

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

.PHONY: all rebuild clean distclean srcinfo
