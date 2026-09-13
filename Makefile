.DELETE_ON_ERROR:
all: upgrade_version build verify 

clean:
	rm -rf pkg src *.deb *.pkg.tar.zst *.log

build:
	pkgctl build
	makepkg --printsrcinfo > .SRCINFO

install: build
	makepkg --install

upgrade_version:
	pkgctl version upgrade

verify:
	pkgctl license check
	namcap PKGBUILD *.pkg.tar.zst

