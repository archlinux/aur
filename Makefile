all: srcinfo rebuild

srcinfo: .SRCINFO

rebuild:
	makepkg -f

clean:
	rm -f -- *.pkg.*

distclean: clean
	rm -rf -- .SRCINFO pkg src

.SRCINFO: PKGBUILD
	makepkg -o  # Update pkgver
	makepkg --printsrcinfo > $@

.PHONY: all rebuild clean distclean srcinfo
