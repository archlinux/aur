.PHONY: clean build default

default: build

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

build: PKGBUILD
	makepkg -s

clean:
	rm -rf src pkg *.tar.zst
