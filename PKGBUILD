# Maintainer: Antonio Breno <coisasaletaorias@gmail.com>
pkgname=zstd-x64v4
pkgver=1.5.7
pkgrel=3
pkgdesc='Zstandard - Fast real-time compression algorithm (x86-64-v4)'
url='https://facebook.github.io/zstd/'
arch=(x86_64)
license=(BSD-3-Clause GPL-2.0-only)

depends=(glibc libgcc libstdc++ zlib xz lz4)
makedepends=(cmake gtest ninja)

provides=("zstd=${pkgver}" libzstd.so)
conflicts=(zstd)

source=(
  https://github.com/facebook/zstd/releases/download/v${pkgver}/zstd-${pkgver}.tar.zst{,.sig}
  https://github.com/facebook/zstd/commit/6af3842118ea5325480b403213b2a9fbed3d3d74.patch
)
sha256sums=(
  5b331d961d6989dc21bb03397fc7a2a4d86bc65a14adc5ffbbce050354e30fd2
  SKIP
  7c07be222d45718b81fb16f97e611adfeb24efa0712ca77fb1e08f4c67803ec3
)
b2sums=(
  20df0493d9d960b8fc98f7cac7630f84dae6226bd906364ab9c9ce7dfb2be44a303fd077e4264979f3ee92efd59072d63c4bb4ae7b65c52f6ce0153513088837
  SKIP
  02e472b01ead30ebc703f64d35ccbfe1db8a9eae6b15a3690e6e5092c6b8cdfaaca585b31b965d94eea7da04cebd6bcca7f5c8bbf9e2c2e84b4acd7f3ce54e5d
)
validpgpkeys=(4EF4AC63455FC9F4545D9B7DEF8FE99528B52FFD)

prepare() {
  cd zstd-${pkgver}
  sed '/build static library to build tests/d' -i build/cmake/CMakeLists.txt
  sed 's/libzstd_static/libzstd_shared/g' -i build/cmake/tests/CMakeLists.txt
  patch -Np1 -i ../6af3842118ea5325480b403213b2a9fbed3d3d74.patch
}

build() {
  cd zstd-${pkgver}
  export CFLAGS+=" -march=x86-64-v4 -ffat-lto-objects"
  export CXXFLAGS+=" -march=x86-64-v4 -ffat-lto-objects"

  cmake -S build/cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DZSTD_ZLIB_SUPPORT=ON \
    -DZSTD_LZMA_SUPPORT=ON \
    -DZSTD_LZ4_SUPPORT=ON \
    -DZSTD_BUILD_CONTRIB=ON \
    -DZSTD_BUILD_STATIC=OFF \
    -DZSTD_BUILD_TESTS=ON \
    -DZSTD_PROGRAMS_LINK_SHARED=ON
  cmake --build build
}

check() {
  cd zstd-${pkgver}
  LD_LIBRARY_PATH="$(pwd)/build/lib" ctest -VV --test-dir build
}

package() {
  cd zstd-${pkgver}
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
