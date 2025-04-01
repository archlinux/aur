# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034

_vkprefix=Vulkan-Tools-vulkan-sdk
pkgname=lib32-vulkan-tools
pkgver=1.4.309.0
pkgrel=1
arch=(x86_64)
url="https://www.khronos.org/vulkan/"
pkgdesc="Vulkan Utilities and Tools (32-bit)"
license=('Apache-2.0')
depends=('lib32-libx11' 'lib32-libxcb' 'lib32-wayland' 'lib32-vulkan-icd-loader')
makedepends=('cmake' 'python' 'vulkan-headers' 'wayland-protocols' 'glslang' 'spirv-tools' 'git' 'volk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/Vulkan-Tools/archive/vulkan-sdk-${pkgver}.tar.gz")
sha256sums=('d854ff4324b519ff4a1cf5d9e9c333e5244ea7870fad6eadd73efd7b04aedcb0')

prepare() {
  cd "${_vkprefix}-${pkgver}"

  # Hack to allow using 64-bit volk (because Vulkan tools only uses the header part)
  sed -i \
    's@find_package(volk QUIET REQUIRED CONFIG)@set(CMAKE_SIZEOF_VOID_P 8)\nfind_package(volk QUIET REQUIRED CONFIG)\nset(CMAKE_SIZEOF_VOID_P 4)@' \
    CMakeLists.txt
}

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
