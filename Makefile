.DELETE_ON_ERROR:
all: build verify

init:
	yay -S --needed devtools nvchecker namcap gendesk

clean:
	rm -rf *.zip *.png *.log *.pkg.*

build:
	updpkgsums
	gendesk -f PKGBUILD
	makepkg --printsrcinfo > .SRCINFO
	pkgctl build

install: build
	makepkg --install

verify:
	shellcheck --shell=bash --exclude=SC2034,SC2154,SC2164 PKGBUILD
	pkgctl license check

release:
	pkgctl release
