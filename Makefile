all: .SRCINFO verify

.SRCINFO: PKGBUILD
	 makepkg --printsrcinfo > .SRCINFO

# These can all be created during verify
clean:
	rm -rf pkg
	rm -rf src
	rm -f poltroon-*.pkg.tar.xz
	rm -f v*.tar.gz

verify:
	makepkg -f
	namcap PKGBUILD
	namcap *.pkg.tar.xz

.PHONY: verify clean all
