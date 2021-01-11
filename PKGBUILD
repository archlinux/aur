# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=lib3mf
pkgver=2.1.0
pkgrel=1
pkgdesc='Implementation of the 3D Manufacturing Format file standard'
arch=('x86_64')
url='https://3mf.io/'
license=('BSD')
depends=('libzip' 'zlib')
makedepends=('cmake')
checkdepends=('gtest' 'openssl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/3MFConsortium/lib3mf/archive/v$pkgver.tar.gz")
sha512sums=('05f92da9cbbac279baf33fe3a7ce43ff7faad987c4ba08120094406e1a8f9bab2330b47822fa0a84d1558be9c829f3e805782a46ed85b706e7f85cb861d0d4f5')

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
