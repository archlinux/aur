# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Tom <reztho@archlinux.org>
# Contributor: bitwave

pkgname=textadept
pkgver=11.1
pkgrel=3
pkgdesc="A fast, minimalist, and remarkably extensible cross-platform text editor"
arch=('i686' 'x86_64' 'aarch64')
url="http://foicica.com/textadept/"
license=('MIT')
depends=('gtk2')
makedepends=('wget' 'unzip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/orbitalquark/$pkgname/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('87d67975b22952344e1bdcb330301b88cdfe8242e7710526cd344ab252499c2a')

prepare() {
	cd "textadept-textadept_$pkgver/src"
	make deps
	## thanks lacsaP
	sed -i '1008s/volatile//;1099s/volatile//;' scintilla/gtk/ScintillaGTKAccessible.cxx
	## makes compile flags work again
	sed -i 's/CFLAGS =/CFLAGS +=/g;s/CXXFLAGS =/CXXFLAGS +=/g;s/LDFLAGS =/LDFLAGS +=/g' Makefile
}

build() {
	cd "textadept-textadept_${pkgver}/src"
	make
	make curses
}

package() {
	cd "$srcdir/textadept-textadept_${pkgver}/src"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
	rm "$pkgdir/usr/share/pixmaps/"textadept{.svg,.png}
	make curses PREFIX=/usr DESTDIR="$pkgdir/" install

	# License
	install -d "$pkgdir/usr/share/licenses/textadept"
	ln -s /usr/share/textadept/LICENSE "$pkgdir/usr/share/licenses/$pkgname/"

	# Documentation
	install -d "$pkgdir/usr/share/doc"
	ln -s /usr/share/textadept/docs "$pkgdir/usr/share/doc/$pkgname"
}
