pkgname=libdeflate-x64v2
pkgver=1.26
pkgrel=1
pkgdesc='Heavily optimized DEFLATE/zlib/gzip compression and decompression (x86-64-v2)'
arch=(x86_64)
url=https://github.com/ebiggers/libdeflate
license=(MIT)
depends=(glibc)
makedepends=(cmake git ninja)

provides=("libdeflate=${pkgver}" libdeflate.so)
conflicts=(libdeflate)

source=(git+https://github.com/ebiggers/libdeflate.git#tag=v${pkgver})
b2sums=('00204ed5c71f5601e2dfa33dd38b32abcd66d9f9257c8a0d3a1c678529c5a94f2cb31a623001a6ffd950a508bd583ad9dabaefb03de112c97c362a32f7264df8')

build() {
  export CFLAGS+=" -march=x86-64-v2"
  export CXXFLAGS+=" -march=x86-64-v2"

  cmake -S libdeflate -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="${CFLAGS}" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
    -DLIBDEFLATE_BUILD_STATIC_LIB=OFF \
    -DLIBDEFLATE_BUILD_TESTS=ON
  cmake --build build
}

check() {
  ctest --test-dir build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 libdeflate/COPYING \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
