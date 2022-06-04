pkgname=mingw-w64-spirv-headers
pkgver=1.3.211.0
pkgrel=1
pkgdesc='SPIR-V Headers (mingw-w64)'
arch=('any')
url='https://www.khronos.org/registry/spir-v/'
license=('Apache')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=(https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/sdk-${pkgver}/spirv-headers-${pkgver}.tar.gz)
sha256sums=('30a78e61bd812c75e09fdc7a319af206b1044536326bc3e85fea818376a12568')


_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd SPIRV-Headers-sdk-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DSPIRV_HEADERS_SKIP_EXAMPLES=ON ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/SPIRV-Headers-sdk-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
  done
}
