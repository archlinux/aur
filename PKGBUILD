# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=lib3mf
pkgver=2.0.0
pkgrel=3
pkgdesc='Implementation of the 3D Manufacturing Format file standard'
arch=('x86_64')
url='https://3mf.io/'
license=('BSD')
depends=('libzip' 'zlib')
makedepends=('cmake')
checkdepends=('gtest>=1.10.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/3MFConsortium/lib3mf/archive/v$pkgver.tar.gz"
        'lib3mf_use-system-gtest.patch::https://github.com/3MFConsortium/lib3mf/commit/140d3351e1efa7f9989e333834f0e47874ed857d.patch'
        'lib3mf_link-libzip-and-zlib.patch::https://github.com/3MFConsortium/lib3mf/commit/2a31c21ff71231b46eb70a33add4239881a90116.patch')
sha512sums=('79683cab67640c1f6b4653ae705e13a39a322dfab72d82fe1f162cb01745f629f3df58819eb15edf4fca44794170277b5c996b5c829364387fd7bb0fddc8ba57'
            '09fdc3a9bdcaaa2e876281adfac845adfb6a3a7005a665b05169b2575228e18de9313587f170052eda3dc87b13d51a3e52463196f7f4fd1fdec0b6703b00893a'
            'e3f0fe3fe06d96ff943673fe1447f55491ff1c9d9958a714412c590aaa4dff6f31d91aa383cea27aade63daee15f41600e1548ef63d5a86b6cdf8bfe06048261')
BUILDENV+=('!check') # TODO re-enable tests once gtest 1.10.0 is in the official repositories

prepare() {
	mkdir build
	cd "$pkgname-$pkgver"
	patch --strip=1 --input="$srcdir/lib3mf_use-system-gtest.patch"
	patch --strip=1 --input="$srcdir/lib3mf_link-libzip-and-zlib.patch"
}

build() {
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_INCLUDEDIR="include/$pkgname" \
	      -DUSE_INCLUDED_LIBZIP=OFF -DUSE_INCLUDED_ZLIB=OFF -DUSE_INCLUDED_GTEST=OFF \
	      $( ((CHECKFUNC)) || echo -DLIB3MF_TESTS=OFF) \
	      "$srcdir/$pkgname-$pkgver"
	make
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
