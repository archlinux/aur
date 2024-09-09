# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034

pkgname=lib32-vulkan-tools
pkgver=1.3.295
pkgrel=1
arch=(x86_64)
url="https://www.khronos.org/vulkan/"
pkgdesc="Vulkan Utilities and Tools (32-bit)"
license=('Apache-2.0')
depends=('lib32-libx11' 'lib32-libxcb' 'lib32-wayland' 'lib32-vulkan-icd-loader')
makedepends=('cmake' 'python' "vulkan-headers>=1:${pkgver}" 'wayland-protocols' 'glslang' 'spirv-tools' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/Vulkan-Tools/archive/v${pkgver}.tar.gz"
        "git+https://github.com/zeux/volk.git#commit=22f73aedb7b25593199c77159de02b67022cedcb") # 1.3.295
sha256sums=('caaf5972173e986605df279b5714f4fc0295769527372ec1752b87e001a8e7cf'
            '70b5ed170727efdd86ce1e9eb2fdd112b4644d363b96adae5d223a3958a6bbfd')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  # Compile volk dependency (why was this introduced?)
  # TODO: Find a better solution to this mess
  if [[ "${CC}" != "clang*" ]]; then
    export OLD_CFLAGS="${CFLAGS}"
    CFLAGS+=" -ffat-lto-objects"
  fi

  cmake -S volk -B build-volk \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DVOLK_INSTALL=ON

  cmake --build build-volk

  DESTDIR="${srcdir}/build-volk/install" cmake --install build-volk

  if [[ "${CC}" != "clang*" ]]; then
      CFLAGS="${OLD_CFLAGS}"
  fi

  # Actually build vulkan-tools
  export CMAKE_PREFIX_PATH="${srcdir}/build-volk/install/usr" # Use manually compiled volk library

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

  mv "${pkgdir}/usr/bin/vkcube-wayland32" "${pkgdir}/usr/bin/vkcube32-wayland"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "Vulkan-Tools-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
