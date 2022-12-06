# Maintainer: Eric Biggers <ebiggers3@gmail.com>

pkgname=libdeflate-git
pkgver=1.15.r0.g0201338
pkgrel=1
pkgdesc='Heavily optimized library for DEFLATE/zlib/gzip compression and decompression'
arch=(x86_64)
url=https://github.com/ebiggers/libdeflate
license=(MIT)
depends=(glibc)
makedepends=(
  cmake
  git
  ninja
)
provides=(libdeflate.so libdeflate)
conflicts=(libdeflate)
source=(git+https://github.com/ebiggers/libdeflate.git)
b2sums=(SKIP)

pkgver() {
  cd libdeflate
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -S libdeflate -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBDEFLATE_BUILD_STATIC_LIB=OFF \
    -DLIBDEFLATE_BUILD_TESTS=ON
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm 644 libdeflate/COPYING -t "${pkgdir}"/usr/share/licenses/libdeflate/
  install -Dm 644 -t "${pkgdir}/usr/share/doc/libdeflate/" libdeflate/{README*,NEWS*}
}

# vim ts=2 sw=2 et:
