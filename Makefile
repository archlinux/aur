all: srcinfo rebuild

srcinfo: .SRCINFO

rebuild:
	makepkg -f

clean:
	rm -f -- *.pkg.*
	rm -rf -- pkg

distclean: clean
	rm -f -- .SRCINFO
	rm -rf -- src

.SRCINFO: PKGBUILD
	makepkg -o  # Update pkgver
	makepkg --printsrcinfo > $@

.PHONY: all rebuild clean distclean srcinfo
