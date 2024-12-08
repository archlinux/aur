# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034

pkgname=lib32-vulkan-tools
pkgver=1.4.303
pkgrel=1
arch=(x86_64)
url="https://www.khronos.org/vulkan/"
pkgdesc="Vulkan Utilities and Tools (32-bit)"
license=('Apache-2.0')
depends=('lib32-libx11' 'lib32-libxcb' 'lib32-wayland' 'lib32-vulkan-icd-loader')
makedepends=('cmake' 'python' "vulkan-headers>=1:${pkgver}" 'wayland-protocols' 'glslang' 'spirv-tools' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/Vulkan-Tools/archive/v${pkgver}.tar.gz"
        "git+https://github.com/zeux/volk.git#commit=a7fa8bedcb5df472d8b16122f77585ad8fc63899") # 1.4.303
sha256sums=('958b646bbc5ac0a54908342df30da8c183690f579dce7f7130ac93d433d9d3a8'
            'b233d5ef123ab40f5990dbc3c0e561a7bfd1e807a42a06964bdaa5be197530ff')

build() {
  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  # Compile volk dependency (why was this introduced?)
  # TODO: Find a better solution to this mess
  cmake -S volk -B build-volk \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DVOLK_INSTALL=ON
  cmake --build build-volk

  DESTDIR="${srcdir}/build-volk/install" cmake --install build-volk
  export CMAKE_PREFIX_PATH="${srcdir}/build-volk/install/usr" # Point to manually compiled volk library

  # Strip LTO metadata (from libmakepkg)
  strip -R .gnu.lto_* -R .gnu.debuglto_* -N __gnu_lto_v1 "${CMAKE_PREFIX_PATH}/lib32/libvolk.a"

  # Actually build vulkan-tools
  cmake -S "Vulkan-Tools-${pkgver}" -B build --fresh \
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
  install -m644 "Vulkan-Tools-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
