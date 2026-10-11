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
	shellcheck --shell=bash --exclude=SC2034,SC2154,SC2164 PKGBUILD
	pkgctl license check
	namcap PKGBUILD *.pkg.tar.zst

release:
	pkgctl release
