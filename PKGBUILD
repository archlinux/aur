# Maintainer: Yaksh Bariya <yaksbari4@gmail.com>

pkgname=lib32-c-ares
pkgver=1.34.6
pkgrel=1
pkgdesc="A C library for asynchronous DNS requests"
arch=(x86_64)
url="https://c-ares.haxx.se/"
license=(MIT)
depends=(lib32-glibc)
makedepends=(cmake)
provides=(libcares.so)
source=(https://github.com/c-ares/c-ares/releases/download/v${pkgver}/c-ares-${pkgver}.tar.gz{,.asc})
sha512sums=('826eecdb40942caf75da982b9ca57fbe7c3e7c23af43a908683c7c1523c46b06ebac68405c26db8bf4c8b0774ca415666866249a3bde663a71c278f4ec7b1827'
            'SKIP')
b2sums=('3a348cfaf4c992ba1712be73907599fd9d3e7b6d1b5498fa86259bbd8c9e102d530e89eee0f668b5b0b8164034047c187be7f8d40016d012c9e451dbf56bfbde'
        'SKIP')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2', # Daniel Stenberg <daniel@haxx.se>
              'DA7D64E4C82C6294CB73A20E22E3D13B5411B7CA') # Brad House <brad@brad-house.com>

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
  install -vDm 644 c-ares-$pkgver/{AUTHORS,{CONTRIBUTING,DEVELOPER-NOTES,README,RELEASE-NOTES}.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
