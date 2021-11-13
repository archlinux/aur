.PHONY: all clean updpkgsums

all: azpainterb-*.pkg.tar.zst

azpainterb-*.pkg.tar.zst: .SRCINFO PKGBUILD
	makepkg -f

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

updpkgsums:
	updpkgsums

clean:
	rm -rf ./src
	rm ./azpainterb-*.tar.* ./azpainterb-*.pkg.tar.*
