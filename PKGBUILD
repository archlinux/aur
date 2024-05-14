# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Felix von Perger <frekkvb@gmail.com>

pkgname=libthreadar
pkgver=1.4.0
pkgrel=2
pkgdesc='C++ library manage threads and any type to exception between them'
arch=('x86_64')
url='http://libthreadar.sourceforge.net/'
license=('LGPL3')
depends=('gcc-libs')
#makedepends=('doxygen' 'man-db' 'groff')
provides=('libthreadar.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Edrusb/libthreadar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6405ed53f2d48237fc63d1a9f85b6cbb344ef9c49bd2090579ea045fbe9deaf9')

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
