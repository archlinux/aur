pkgname=mingw-w64-volk
pkgver=1.3.283.0
pkgrel=1
arch=(any)
url="https://github.com/zeux/volk"
pkgdesc="Meta loader for Vulkan API (mingw-w64)"
license=('MIT')
depends=(mingw-w64-vulkan-icd-loader mingw-w64-vulkan-headers)
makedepends=(mingw-w64-cmake)
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/zeux/volk/archive/refs/tags/vulkan-sdk-${pkgver}.tar.gz")
sha256sums=('872035f1f26c53b218632a3a8dbccbd276710aaabafb9bb1bc1a6c0633ee6aab')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}"/volk-vulkan-sdk-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} -DVOLK_INSTALL=ON .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/volk-vulkan-sdk-${pkgver}/build-${_arch}
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
