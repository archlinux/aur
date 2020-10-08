.PHONY: all clean updpkgsums

all: azpainterb-*.pkg.tar

azpainterb-*.pkg.tar: updpkgsums .SRCINFO PKGBUILD
	makepkg -f

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

updpkgsums:
	updpkgsums

clean:
	rm azpainterb-*.tar.xz azpainterb-*.pkg.tar
