.DELETE_ON_ERROR:
all: upgrade build verify

init:
	yay -S --needed devtools nvchecker namcap

clean:
	rm -rf pkg src *.deb *.pkg.tar.zst *.log

build:
	pkgctl build
	makepkg --printsrcinfo > .SRCINFO

install: build
	makepkg --install

upgrade:
	pkgctl version upgrade

verify:
	pkgctl license check
	namcap PKGBUILD *.pkg.tar.zst

release:
	pkgctl release
