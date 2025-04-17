# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Felix von Perger <frekkvb@gmail.com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=libthreadar
pkgver=1.5.2
pkgrel=1
pkgdesc='C++ library manage threads and any type to exception between them'
arch=('x86_64')
url='http://libthreadar.sourceforge.net'
license=('LGPL3')
depends=('gcc-libs')
#makedepends=('doxygen' 'man-db' 'groff')
provides=('libthreadar.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Edrusb/libthreadar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6b7c12034d0459d064f59acc416083b2c6c6e77b2c7307a918f93dac20c34226')

prepare() {
	cd "$pkgname-$pkgver"

	# unbreak build (this is not installed, yet always built, and is broken)
	sed -r 's|(-all)?-static||' -i doc/examples/Makefile.am

	#misc/init
	cp -av build/{configure.ac,Makefile.am,ChangeLog} -t .
	autoreconf -fiv
}

build() {
	cd "$pkgname-$pkgver"
	# --{enable,disable}-build-html is broken beyond repair
	./configure --prefix=/usr --sysconfdir=/etc --disable-static --enable-shared #--disable-build-html
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install #pkgdatadir="/usr/share/doc/$pkgname/html"
	install -Dm644 AUTHORS README THANKS -t "$pkgdir/usr/share/doc/$pkgname/"
	#rm -rf "${pkgdir}/usr/share/doc/dar/html/man"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
