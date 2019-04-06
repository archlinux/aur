clean:
	rm -f hadolint-Linux-x86_64 hadolint-bin-*.pkg.*

geninteg:
	makepkg --geninteg >> PKGBUILD

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

build:
	makepkg

install:
	makepkg --install
