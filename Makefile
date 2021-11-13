.PHONY: all clean check updpkgsums install

all: azcomicv-*.pkg.tar.zst

azcomicv-*.pkg.tar.zst: .SRCINFO PKGBUILD
	makepkg -f

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

install:
	makepkg -si

update:
	sh ./update.sh

clean:
	rm -rf ./src
	rm azcomicv-*.tar.* azcomicv-*.pkg.*

check: all
	namcap azcomicv-*.pkg.tar.zst
