all: clean build

clean:
	rm -f hadolint-*

geninteg:
	makepkg --geninteg >> PKGBUILD

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

build:
	makepkg

install:
	makepkg --install
