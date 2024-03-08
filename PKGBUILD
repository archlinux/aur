pkgname=mingw-w64-spirv-tools
pkgver=2023.6
_tag="${pkgver}.rc1"
pkgrel=1
pkgdesc='API and commands for processing SPIR-V modules (mingw-w64)'
arch=('any')
url='https://github.com/KhronosGroup/SPIRV-Tools'
license=('Apache')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'mingw-w64-spirv-headers' 'git' 'make' 'python')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/KhronosGroup/SPIRV-Tools/archive/refs/tags/v${_tag}.tar.gz")
sha256sums=('750e4bfcaccd636fb04dd912b668a8a6d29940f8f83b7d9a266170b1023a1a89')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd SPIRV-Tools-${_tag}
  python3 utils/git-sync-deps
  for _arch in ${_architectures}; do
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DSPIRV_SKIP_EXECUTABLES=ON \
      -DSPIRV_SKIP_TESTS=ON \
      -DSPIRV_WERROR=OFF \
      -DSPIRV-Headers_SOURCE_DIR=/usr/${_arch} \
      -B build-${_arch} -S .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/SPIRV-Tools-${_tag}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}

