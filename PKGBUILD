# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=lib3mf
pkgver=2.2.0
pkgrel=1
pkgdesc='Implementation of the 3D Manufacturing Format file standard'
arch=('x86_64')
url='https://3mf.io/'
license=('BSD')
depends=('libzip' 'zlib')
makedepends=('cmake')
checkdepends=('gtest' 'openssl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/3MFConsortium/lib3mf/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('2a9ee92312396b8966967a7ed696c58c69a77438f94432ad071659adc8c9d12fba34a3cf3d8c8d3ad3b26c12c9a89f4d8645e6f396987dc05b04952b004a1f07')

build() {
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_INCLUDEDIR="include/$pkgname" \
	      -DCMAKE_CXX_FLAGS="${CXXFLAGS} ${CPPFLAGS}" \
	      -DUSE_INCLUDED_LIBZIP=OFF -DUSE_INCLUDED_ZLIB=OFF -DUSE_INCLUDED_GTEST=OFF -DUSE_INCLUDED_SSL=OFF \
	      $( ((CHECKFUNC)) || echo -DLIB3MF_TESTS=OFF) \
	      -B build -S "$srcdir/$pkgname-$pkgver"
	make -C build VERBOSE=1
}

check() {
	cd build
	ctest
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
