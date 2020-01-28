# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgbase=vulkan-extensionlayer-git
pkgname=({,lib32-}vulkan-extensionlayer-git)
pkgver=r11.8812d5c478
pkgrel=1
pkgdesc="Layer providing Vulkan features when native support is unavailable"
arch=(x86_64)
url="https://github.com/KhronosGroup/Vulkan-ExtensionLayer"
license=(Apache)
source=("git+$url")
sha256sums=('SKIP')
depends=(vulkan-icd-loader)
makedepends=(cmake ninja vulkan-headers)
checkdepends=()
provides=(vulkan-extensionlayer)
conflicts=(vulkan-extensionlayer)

pkgver() {
  cd Vulkan-ExtensionLayer
  printf 'r%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse HEAD | head -c10)
}

prepare() {
  cmake \
    -S Vulkan-ExtensionLayer -B build64 \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D BUILD_LAYERS=ON

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  cmake \
    -S Vulkan-ExtensionLayer -B build32 \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_INSTALL_LIBDIR=lib32 \
    -D BUILD_LAYERS=ON
}

build_vulkan-extensionlayer-git() {
  ninja -C build64
}

build_lib32-vulkan-extensionlayer-git() {
  ninja -C build32
}

package_vulkan-extensionlayer-git() {
  DESTDIR="$pkgdir" ninja -C build64 install
}

package_lib32-vulkan-extensionlayer-git() {
  pkgdesc+=" (library for 32-bit applications)"
  provides=(lib32-vulkan-extensionlayer)
  conflicts=(lib32-vulkan-extensionlayer)
  depends+=(vulkan-extensionlayer)

  DESTDIR="$pkgdir" ninja -C build32 install

  # Delete conflicting file provided by vulkan-extensionlayer
  rm "$pkgdir"/usr/share/vulkan/explicit_layer.d/VkLayer_khronos_timeline_semaphore.json
}
