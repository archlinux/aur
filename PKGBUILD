pkgname=mingw-w64-vulkan-validation-layers
pkgver=1.2.172
pkgrel=1
arch=(any)
url="https://www.khronos.org/vulkan/"
pkgdesc="Vulkan Validation Layers (mingw-w64)"
license=('custom')
depends=(mingw-w64-vulkan-icd-loader)
makedepends=(mingw-w64-cmake python-lxml mingw-w64-vulkan-headers)
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/KhronosGroup/Vulkan-ValidationLayers/archive/v${pkgver}.tar.gz")
sha256sums=('0e29bf2545658177d37052bcce09f29d3f464caf31d00a84c37368dd1a660d29')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}"/Vulkan-ValidationLayers-${pkgver}
  sed -i "s|WinSock2.h|winsock2.h|g" layers/vk_loader_platform.h
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../scripts/update_deps.py
    ${_arch}-cmake \
      -DVULKAN_HEADERS_INSTALL_DIR=/usr/${_arch} \
      -DGLSLANG_INSTALL_DIR=/usr/${_arch} \
      -DSPIRV_HEADERS_INSTALL_DIR=/usr/${_arch} \
      -DBUILD_LAYER_SUPPORT_FILES=ON ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/Vulkan-ValidationLayers-${pkgver}/build-${_arch}
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.exe
  done
}
