# Maintainer: Xentec <artificial.i7 at gmail dot com>

pkgname=cppformat
pkgver=1.1.0
pkgrel=1
pkgdesc="Small, safe and fast formatting library for C++"
arch=('i686' 'x86_64')
url="http://cppformat.github.io"
license=('BSD')
depends=('gcc-libs')
conflicts=('cppformat-git')
makedepends=('cmake')
source=("https://github.com/cppformat/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('d859f7e520629351294e194f0d1fb889b1edda9a44c139b126562107c1783142')

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build && cd build

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_SHARED_LIBS=1 \
		-Wno-dev \
		..
	make
}

check() {
	cd "$pkgname-$pkgver"
	cd build
	make test
}

package() {
	cd "$pkgname-$pkgver"

	sed -n '/License/{:a;n;/Documentation License/b;p;ba}' README.rst | tail -n +1 >> LICENSE

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 format.h "${pkgdir}/usr/include/format.h"
	
	cd build
	
	install -D -m755 libformat.so "$pkgdir/usr/lib/libformat.so"
}

