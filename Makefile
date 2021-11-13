.PHONY: all clean updpkgsums install

all: apdtool-*.pkg.tar.zst

apdtool-*.pkg.tar.zst: .SRCINFO PKGBUILD
	makepkg -f

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

install:
	makepkg -si

update:
	sh ./update.sh

clean:
	rm -rf ./src
	rm apdtool-*.tar.* apdtool-*.pkg.tar.*
