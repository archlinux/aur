pkgname=mingw-w64-spirv-tools
pkgver=2023.2
pkgrel=1
pkgdesc='API and commands for processing SPIR-V modules (mingw-w64)'
arch=('any')
url='https://github.com/KhronosGroup/SPIRV-Tools'
license=('Apache')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'mingw-w64-spirv-headers' 'git' 'make' 'python')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/KhronosGroup/SPIRV-Tools/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7416cc8a98a10c32bacc36a39930b0c5b2a484963df5d68f388ed7ffee1faad3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd SPIRV-Tools-${pkgver}
  python3 utils/git-sync-deps
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
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

