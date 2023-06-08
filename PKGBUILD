# Maintainer: Yaksh Bariya <yaksbari4@gmail.com>

pkgname=lib32-c-ares
pkgver=1.19.1
pkgrel=1
pkgdesc="A C library for asynchronous DNS requests"
arch=(x86_64)
url="https://c-ares.haxx.se/"
license=(MIT)
depends=(glibc)
makedepends=(cmake)
provides=(libcares.so)
source=(https://github.com/c-ares/c-ares/releases/download/cares-${pkgver//./_}/c-ares-$pkgver.tar.gz{,.asc})
sha512sums=('466a94efda626e815a6ef7a890637056339f883d549ea6055e289fd8cd2391130e5682c905c0fb3bd7e955af7f6deb793562c170eb0ee066a4a62085a82ba470'
            'SKIP')
b2sums=('4b6c9593edb1a91ab76d54ddacb1cd5d67006d5e628ea1f3289f54e9360be32abeb5d8fc7d23e193feab3e7928e8efde82757eb12fe217dc92ed0d9132bedf5d'
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
