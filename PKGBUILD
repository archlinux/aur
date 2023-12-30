# Maintainer: Yaksh Bariya <yaksbari4@gmail.com>

pkgname=lib32-c-ares
pkgver=1.24.0
pkgrel=1
pkgdesc="A C library for asynchronous DNS requests"
arch=(x86_64)
url="https://c-ares.haxx.se/"
license=(MIT)
depends=(lib32-glibc)
makedepends=(cmake)
provides=(libcares.so)
source=(https://github.com/c-ares/c-ares/releases/download/cares-${pkgver//./_}/c-ares-$pkgver.tar.gz{,.asc})
sha512sums=('3701853e263de94daf19734185ad913848c19b825e0738926b418a54b0628ee1ac95a49ebfaa2ddf3eed74a7ef209e1a0a8f573df3e507ef1f11fcc53fc5eb68'
            'SKIP')
b2sums=('aae99e1b5715ae4c68b84e3ceedf3e9758cf0f961bb85bfe870def2bd0342ac26d71a3a784708050c7a339360962567031e83c6b9a61a163ecaba0def6ceb24d'
        'SKIP')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') # Daniel Stenberg <daniel@haxx.se>

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"
  local cmake_options=(
    -B build
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib32
    -DCMAKE_BUILD_TYPE=None
    -S c-ares-$pkgver
    -Wno-dev
  )
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -rf "$pkgdir"/usr/{bin,include,share}
  install -vDm 644 c-ares-$pkgver/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 c-ares-$pkgver/{AUTHORS,CHANGES,{CONTRIBUTING,README}.md,RELEASE-NOTES} -t "$pkgdir/usr/share/doc/$pkgname/"
}
