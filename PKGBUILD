# Maintainer: Garrett Fairburn <gfairburn.aur at gmail.com>
pkgname=miniwi-font-git
pkgver=1.0.r37.g80903cc
pkgrel=1
pkgdesc="Tiny 4x8 font for X11 and the Linux console"
arch=('any')
url="http://josuah.net/git/miniwi/"
license=('custom')
makedepends=('git')
source=("$pkgname::git://git.josuah.net/${pkgname%-font-git}")
md5sums=('SKIP')

prepare() {
	cd $pkgname
	# File "miniwi-16.psf" is broken and must be regenerated.
	rm miniwi-16.psf
}

pkgver() {
	cd $pkgname
	echo -n "$(pcregrep -o1 "FONT_VERSION \"(.*)\"" miniwi-8.bdf)"
	echo -n ".r$(git rev-list --count --first-parent HEAD)"
	echo ".g$(git log -n 1 --format=%h)"
}

build() {
	cd $pkgname
	bdf-to-psf/bdf2psf --fb miniwi-16.bdf \
		bdf-to-psf/equivalents \
		bdf-to-psf/uni-2.set+bdf-to-psf/box-blocks.set \
		512 \
		miniwi-16.psf
	gzip -f miniwi-8.psf miniwi-16.psf
}

package() {
	cd $pkgname
	install -d "$pkgdir/usr/share/kbd/consolefonts"
	install -t "$pkgdir/usr/share/kbd/consolefonts" -m644 *.psf.gz
	install -d "$pkgdir/usr/share/fonts/${pkgname%-font-git}"
	install -t "$pkgdir/usr/share/fonts/${pkgname%-font-git}" -m644 *.bdf
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
