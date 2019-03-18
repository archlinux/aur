clean:
	rm hadolint-Linux-x86_64 hadolint-bin-*.pkg.*

geninteg:
	makepkg --geninteg

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

build:
	makepkg

install:
	makepkg --install
