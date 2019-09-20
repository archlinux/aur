# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=fossilize-git
pkgver=0.0.0+413.0b082debfb
pkgrel=1
pkgdesc="Library and Vulkan layer for serializing various persistent Vulkan objects which typically end up in hashmaps"
arch=(x86_64)
url="https://github.com/ValveSoftware/Fossilize"
license=(MIT)
depends=()
makedepends=(git cmake ninja)
source=("git+$url")
sha256sums=('SKIP')
conflicts=(fossilize)

pkgver() {
  cd Fossilize
  printf '0.0.0+%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse HEAD | head -c10)
}

prepare() {
  cd Fossilize
  git submodule update --init --recursive
  cmake -S . -B ../build \
    -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release
}

build() {
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
