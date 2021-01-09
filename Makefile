.PHONY: all clean check updpkgsums install

all: azcomicv-*.pkg.tar.zst

azcomicv-*.pkg.tar.zst: .SRCINFO PKGBUILD
	makepkg -f

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

updpkgsums:
	updpkgsums

install:
	makepkg -si

clean:
	rm azcomicv-*.tar.xz azcomicv-*.pkg.*

check: all
	namcap azcomicv-*.pkg.tar.zst
