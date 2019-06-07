# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=fossilize-git
pkgver=0.0.0+335.04599f270a
pkgrel=1
pkgdesc="Library and Vulkan layer for serializing various persistent Vulkan objects which typically end up in hashmaps"
arch=(x86_64)
url="https://github.com/ValveSoftware/Fossilize"
license=(MIT)
depends=()
makedepends=(rapidjson)
source=("git+$url")
sha256sums=('SKIP')
conflicts=(fossilize)

pkgver() {
  cd Fossilize
  printf '0.0.0+%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse HEAD | head -c10)
}

build() {
  cd Fossilize
  git submodule update --init --recursive
  mkdir -p build
  cd build
  cmake .. \
    -DFOSSILIZE_RAPIDJSON_INCLUDE_PATH=/usr/include/rapidjson/ \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd Fossilize/build

  install -dm755 "$pkgdir/usr/bin"
  install -m755 cli/fossilize-* "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/lib" "$pkgdir/usr/share/vulkan/explicit_layer.d"
  install -m755 layer/libVkLayer_fossilize.so "$pkgdir/usr/lib"
  install -m644 layer/VkLayer_fossilize.json "$pkgdir/usr/share/vulkan/explicit_layer.d"
}
