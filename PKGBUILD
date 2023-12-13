# Maintainer: Marijn Suijten <marijns95 at gmail dot com>

pkgbase=vulkan-wsi-layer-git
pkgname=({,lib32-}vulkan-wsi-layer-git)
pkgver=r108.760d2f2
pkgrel=1
pkgdesc="Vulkan® Window System Integration Layer"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/mesa/vulkan-wsi-layer"
license=(MIT)
source=("git+$url")
sha256sums=('SKIP')
depends=(vulkan-icd-loader)
makedepends=(git cmake ninja vulkan-headers)

pkgver() {
  cd "${srcdir}/vulkan-wsi-layer"
  # There are currently no tags in this repository, use number of commits and git hash
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake \
    -S vulkan-wsi-layer -B build64 \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr

  ninja -C build64

  CC='gcc -m32' \
  CXX='g++ -m32' \
  PKG_CONFIG_PATH='/usr/lib32/pkgconfig' \
  cmake \
    -S vulkan-wsi-layer -B build32 \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_INSTALL_LIBDIR=lib32

  ninja -C build32
}

package_vulkan-wsi-layer-git() {
  provides=(vulkan-wsi-layer)
  conflicts=(vulkan-wsi-layer)

  install -Dm644 vulkan-wsi-layer/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 build64/libVkLayer_window_system_integration.so -t "${pkgdir}/usr/lib/"

  sed -i 's;./libVkLayer_window_system_integration.so;libVkLayer_window_system_integration.so;' build64/VkLayer_window_system_integration.json
  install -Dm644 build64/VkLayer_window_system_integration.json -t "${pkgdir}/usr/share/vulkan/explicit_layer.d/"
}

package_lib32-vulkan-wsi-layer-git() {
  pkgdesc+=" (library for 32-bit applications)"
  provides=(lib32-vulkan-wsi-layer)
  conflicts=(lib32-vulkan-wsi-layer)
  # For the layer JSON description
  depends+=(vulkan-wsi-layer)

  install -Dm644 vulkan-wsi-layer/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 build32/libVkLayer_window_system_integration.so -t "${pkgdir}/usr/lib32/"
}
