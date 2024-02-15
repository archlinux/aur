# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034

pkgname=lib32-vulkan-tools
pkgver=1.3.276
pkgrel=1
arch=(x86_64)
url="https://www.khronos.org/vulkan/"
pkgdesc="Vulkan Utilities and Tools (32-bit)"
license=('Apache-2.0')
depends=('lib32-libx11' 'lib32-wayland' 'lib32-vulkan-icd-loader')
makedepends=('cmake' 'python' 'vulkan-headers' 'wayland-protocols' 'glslang' 'spirv-tools' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/Vulkan-Tools/archive/v${pkgver}.tar.gz"
        "git+https://github.com/zeux/volk.git#commit=6963dc43cae2066b205a02cbbc6b12bbbb5691ef") # 1.3.276
sha256sums=('24598dd9031cd7cce9b7d9446b466a18bae9fd009579da865330e2dc9d0a2bf9'
            'SKIP')

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

  cmake -S "Vulkan-Tools-${pkgver}" -B build \
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
