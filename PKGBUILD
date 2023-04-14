# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034

pkgname=lib32-vulkan-tools
pkgver=1.3.247
pkgrel=1
arch=(x86_64)
url="https://www.khronos.org/vulkan/"
pkgdesc="Vulkan Utilities and Tools (32-bit)"
license=('custom')
depends=('lib32-libx11' 'lib32-wayland' 'lib32-vulkan-icd-loader')
makedepends=('cmake' 'python' 'vulkan-headers' 'wayland-protocols' 'glslang' 'spirv-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/Vulkan-Tools/archive/v${pkgver}.tar.gz")
sha256sums=('3c7f9d81d599a36871cc122501713cd67882be4777872c8c5e17834e2c2047a1')

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
