pkgname=mingw-w64-vulkan-tools
pkgver=1.4.341
pkgrel=1
arch=(any)
url="https://www.khronos.org/vulkan/"
pkgdesc="Vulkan Utilities and Tools (mingw-w64)"
license=('custom')
depends=(mingw-w64-vulkan-icd-loader)
makedepends=(mingw-w64-cmake python mingw-w64-vulkan-headers mingw-w64-glslang mingw-w64-spirv-tools mingw-w64-wine mingw-w64-volk)
options=('!buildflags' 'staticlibs' '!strip')
source=(
  'normalizer'
)
sha256sums=(
  'SKIP'
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  sudo "$srcdir/normalizer"
  cd "${srcdir}"/Vulkan-Tools-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DBUILD_CUBE=ON -DBUILD_VULKANINFO=ON -DBUILD_ICD=OFF \
      -DGLSLANG_INSTALL_DIR=/usr/${_arch} -DGLSLANG_VALIDATOR=/usr/bin/${_arch}-glslang \
      -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/Vulkan-Tools-${pkgver}/build-${_arch}
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.exe
  done
}

