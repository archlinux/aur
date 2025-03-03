srcinfo: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

sums: PKGBUILD .SRCINFO
	makepkg --geninteg

build: PKGBUILD .SRCINFO
	makepkg --cleanbuild --force

test: PKGBUILD .SRCINFO
	make build
	namcap PKGBUILD
	namcap *.pkg.tar.zst

install: PKGBUILD .SRCINFO
	make build
	makepkg --install

clean:
	rm -rf GOVERNANCE LICENSE README *.tar.* pkg src
