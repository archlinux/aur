# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=lib3mf
pkgver=2.0.0
pkgrel=6
pkgdesc='Implementation of the 3D Manufacturing Format file standard'
arch=('x86_64')
url='https://3mf.io/'
license=('BSD')
depends=('libzip' 'zlib')
makedepends=('cmake')
checkdepends=('gtest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/3MFConsortium/lib3mf/archive/v$pkgver.tar.gz"
        'lib3mf_use-system-gtest.patch::https://github.com/3MFConsortium/lib3mf/commit/140d3351e1efa7f9989e333834f0e47874ed857d.patch'
        'lib3mf_link-libzip-and-zlib.patch::https://github.com/3MFConsortium/lib3mf/commit/2a31c21ff71231b46eb70a33add4239881a90116.patch')
sha512sums=('79683cab67640c1f6b4653ae705e13a39a322dfab72d82fe1f162cb01745f629f3df58819eb15edf4fca44794170277b5c996b5c829364387fd7bb0fddc8ba57'
            '55eadd457fbc54d4ee8f22a401c033ad834fb1c59fbb5be06ac8019343a0a6cb82f7cad70518511b4882597a3119c674f8e9ef53fd501cdb462d4ce5b1f66c37'
            '22246e3d155720f89c78a95e1277592f8730d79e5bc0e11b2cac0ea7d0bd8f7b0ed785ebc2aba1e823ca1b2bb6e911ea081dab7062db9f64660785b77fb14f5e')

prepare() {
	cd "$pkgname-$pkgver"
	patch --strip=1 --input="$srcdir/lib3mf_use-system-gtest.patch"
	patch --strip=1 --input="$srcdir/lib3mf_link-libzip-and-zlib.patch"
}

build() {
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_INCLUDEDIR="include/$pkgname" \
	      -DCMAKE_CXX_FLAGS="${CXXFLAGS} ${CPPFLAGS}" \
	      -DUSE_INCLUDED_LIBZIP=OFF -DUSE_INCLUDED_ZLIB=OFF -DUSE_INCLUDED_GTEST=OFF \
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
