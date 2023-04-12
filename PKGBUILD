# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034

pkgname=lib32-vulkan-tools
pkgver=1.3.246
pkgrel=1
arch=(x86_64)
url="https://www.khronos.org/vulkan/"
pkgdesc="Vulkan Utilities and Tools (32-bit)"
license=('custom')
depends=('lib32-libx11' 'lib32-wayland' 'libvulkan.so')
makedepends=('cmake' 'python' 'vulkan-headers' 'lib32-vulkan-icd-loader' 'wayland-protocols' 'glslang' 'spirv-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/Vulkan-Tools/archive/v${pkgver}.tar.gz")
sha256sums=('1aeefae204d5f750d7d46adba53bbfed5ac5b663fdefdcca57ef1bf2b8b07aef')

prepare() {
  cd "${srcdir}/Vulkan-Tools-${pkgver}"

  rm -rf build{,-wayland} && mkdir build{,-wayland}
}

build() {
  cd "${srcdir}/Vulkan-Tools-${pkgver}/build"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_LIBRARY_PATH=/usr/lib32 \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_DATADIR=/usr/share \
    -DCMAKE_SKIP_RPATH=True \
    -DBUILD_WSI_XCB_SUPPORT=On \
    -DBUILD_WSI_XLIB_SUPPORT=On \
    -DBUILD_WSI_WAYLAND_SUPPORT=On \
    -DBUILD_CUBE=ON \
    -DBUILD_VULKANINFO=ON \
    -DBUILD_ICD=OFF \
    -DGLSLANG_INSTALL_DIR=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make

  cd "${srcdir}/Vulkan-Tools-${pkgver}/build-wayland"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_LIBRARY_PATH=/usr/lib32 \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_DATADIR=/usr/share \
    -DCMAKE_SKIP_RPATH=True \
    -DBUILD_WSI_XCB_SUPPORT=OFF \
    -DBUILD_WSI_XLIB_SUPPORT=OFF \
    -DBUILD_WSI_WAYLAND_SUPPORT=On \
    -DBUILD_CUBE=ON \
    -DCUBE_WSI_SELECTION=WAYLAND \
    -DBUILD_VULKANINFO=OFF \
    -DBUILD_ICD=OFF \
    -DGLSLANG_INSTALL_DIR=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
}

package() {
  cd "${srcdir}/Vulkan-Tools-${pkgver}/build"
  
  make DESTDIR="${pkgdir}" install

  install -m755 ../build-wayland/cube/vkcube-wayland "${pkgdir}"/usr/bin/

  for i in "${pkgdir}/usr/bin/"*; do
    mv "$i" "$i"32
  done

  mv "${pkgdir}/usr/bin/vkcube-wayland32" "${pkgdir}/usr/bin/vkcube32-wayland"

  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 ../LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/
}
