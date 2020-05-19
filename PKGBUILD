pkgname=mingw-w64-spirv-tools
pkgver=2020.2
pkgrel=1
pkgdesc="API and commands for processing SPIR-V modules (mingw-w64)"
arch=('any')
url="https://www.khronos.org/vulkan/"
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'mingw-w64-spirv-headers' 'python')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/KhronosGroup/SPIRV-Tools/archive/v${pkgver}.tar.gz")
sha256sums=('29f376f6ebc24d3ce39c1aa47101c4b5d256c8247e41068b541dd43bb88d4174')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd SPIRV-Tools-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake  \
      -DCMAKE_BUILD_TYPE=Release \
      -DSPIRV-Headers_SOURCE_DIR=/usr/${_arch} \
      -DSPIRV_SKIP_EXECUTABLES=ON \
      -DSPIRV_SKIP_TESTS=ON \
      ..
    make
    popd
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake  \
      -DCMAKE_BUILD_TYPE=Release \
      -DSPIRV-Headers_SOURCE_DIR=/usr/${_arch} \
      -DSPIRV_SKIP_EXECUTABLES=ON \
      -DSPIRV_SKIP_TESTS=ON \
      -DBUILD_SHARED_LIBS=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/SPIRV-Tools-${pkgver}/build-${_arch}-static"
    make DESTDIR="${pkgdir}" install
    cd "${srcdir}/SPIRV-Tools-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
