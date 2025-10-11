# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034

_vkprefix=Vulkan-Tools-vulkan-sdk
pkgname=lib32-vulkan-tools
pkgver=1.4.328.1
pkgrel=1
arch=(x86_64)
url="https://www.khronos.org/vulkan/"
pkgdesc="Vulkan Utilities and Tools (32-bit)"
license=('Apache-2.0')
depends=('lib32-libx11' 'lib32-libxcb' 'lib32-wayland' 'lib32-vulkan-icd-loader')
makedepends=('cmake' 'python' 'vulkan-headers' 'wayland-protocols' 'glslang' 'spirv-tools' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/Vulkan-Tools/archive/vulkan-sdk-${pkgver}.tar.gz")
sha256sums=('617e91b396ac771869d62cd131f05dcc0b82d038744dab7f575bcf213852f8bf')

build() {
  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake -S "${_vkprefix}-${pkgver}" -B build --fresh \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_DATADIR=/usr/share \
    -DCMAKE_SKIP_RPATH=True \
    -DBUILD_WSI_XCB_SUPPORT=On \
    -DBUILD_WSI_XLIB_SUPPORT=On \
    -DBUILD_WSI_WAYLAND_SUPPORT=On \
    -DBUILD_CUBE=ON \
    -DBUILD_VULKANINFO=ON \
    -DBUILD_ICD=OFF \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  for i in "${pkgdir}/usr/bin/"*; do
    mv "$i" "$i"32
  done

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${_vkprefix}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
