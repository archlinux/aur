all: .SRCINFO rebuild

rebuild:
	makepkg -f

clean:
	rm -f -- *.pkg.*

distclean: clean
	rm -rf -- .SRCINFO pkg src

.SRCINFO: PKGBUILD
	makepkg -o  # Update pkgver
	makepkg --printsrcinfo > $@

.PHONY: all rebuild clean distclean
