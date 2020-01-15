# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vulkan-extensionlayer-git
pkgver=r4.e15509e728
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
conflicts=(vulkan-extensionlayer)
#provides=("vulkan-extensionlayer=${pkgver%+*}")

pkgver() {
  cd Vulkan-ExtensionLayer
  printf 'r%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse HEAD | head -c10)
}

prepare() {
  cmake \
    -S Vulkan-ExtensionLayer -B . \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D BUILD_LAYERS=ON \
    -D BUILD_TESTS=ON
}

build() {
  ninja
}

check() {
  ninja test
}

package() {
  DESTDIR="$pkgdir" ninja install
}
