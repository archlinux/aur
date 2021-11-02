pkgname=mingw-w64-spirv-tools
pkgver=2021.3
pkgrel=1
pkgdesc="API and commands for processing SPIR-V modules (mingw-w64)"
arch=('any')
url="https://www.khronos.org/vulkan/"
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'mingw-w64-spirv-headers' 'python' 'git')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/KhronosGroup/SPIRV-Tools/archive/v${pkgver}.tar.gz"
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git")
sha256sums=('b6b4194121ee8084c62b20f8d574c32f766e4e9237dfe60b0658b316d19c6b13'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd SPIRV-Tools-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DSPIRV-Headers_SOURCE_DIR="${srcdir}"/SPIRV-Headers \
      -DSPIRV_SKIP_EXECUTABLES=ON \
      -DSPIRV_SKIP_TESTS=ON \
      -DSPIRV_WERROR=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/SPIRV-Tools-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
