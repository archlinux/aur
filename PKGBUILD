# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=lib3mf
pkgver=2.1.1
pkgrel=1
pkgdesc='Implementation of the 3D Manufacturing Format file standard'
arch=('x86_64')
url='https://3mf.io/'
license=('BSD')
depends=('libzip' 'zlib')
makedepends=('cmake')
checkdepends=('gtest' 'openssl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/3MFConsortium/lib3mf/archive/v$pkgver.tar.gz")
sha512sums=('43b1091721e994adfa8390ed6542dc207b62dee278d8747fcca044692a72123c3445d4e7795d5476d15bb535fd1a3ce1da2c2796ab8edb28eb66528778fec846')

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
