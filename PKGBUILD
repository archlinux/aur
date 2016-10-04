# Maintainer: BrainDamage
pkgname="sdump-git"
pkgrel=1
pkgver=20161004.c5fb55b
pkgdesc="sixel variant of idump with a w3mimgdisplay-compatible program"
arch=("i686" "x86_64")
url="https://github.com/uobikiemukot/sdump/"
license=("MIT")
depends=("libjpeg-turbo" "libpng" "libsixel")
optdepends=(
	"wget: to use surl"
	#"mupdf: to use spdf" arch package lacks mudraw
)
sha1sums=("SKIP")
source=("git+https://github.com/uobikiemukot/sdump")

pkgver() {
	cd "sdump"
	#uuuugly code to use date + current git hash in lieu of absent release tag
	echo "$(date +%Y%m%d).$(git describe --always)"
}

build() {
	# this project uses CFLAGS and LDFLAGS to set the optins, but pacman tries to add its own, and the makefile is set to reject current
	# if the var is set, and chaining default flags won't make it build, so we uset them here
	#FIXME: figure out which specific flag is making it fail
	cd "sdump"
	unset CFLAGS
	unset LDFLAGS
	make
	cd "yaimg-sixel"
	make
}

package() {
	cd "sdump"
	install -D "sdump" "$pkgdir/usr/bin/sdump"
	install -D "yaimg-sixel/yaimg-sixel" "$pkgdir/usr/bin/yaimg-sixel"
	install -D "scripts/surl" "$pkgdir/usr/bin/surl"
	install -D "scripts/sviewer" "$pkgdir/usr/bin/sviewer"
	#install -D "scripts/spdf" "$pkgdir/usr/bin/spdf"
}

post_install() {
	echo "In order to use yaimg-sixel in place of w3mimgdisplay to have w3m render images using sixels, you have to:"
	echo "rm /usr/lib/w3m/w3mimgdisplay"
	echo "ln -s /usr/bin/yaimg-sixel /usr/lib/w3m/w3mimgdisplay"
	echo "Add NoExtract = /usr/lib/w3m/w3mimgdiplay to pacman.conf so that further w3m updates won't override the symlink"
}
