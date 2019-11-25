# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=fossilize-git
pkgver=0.0.0+428.1a5ff351f1
pkgrel=1
pkgdesc="Library and Vulkan layer for serializing various persistent Vulkan objects which typically end up in hashmaps"
arch=(x86_64)
url="https://github.com/ValveSoftware/Fossilize"
license=(MIT)
depends=()
makedepends=(git cmake ninja)
source=("git+$url"
        git+https://github.com/KhronosGroup/SPIRV-Cross
        git+https://github.com/KhronosGroup/SPIRV-Headers
        git+https://github.com/KhronosGroup/SPIRV-Tools
        git+https://github.com/tronkko/dirent
        git+https://github.com/zeux/volk
        git+https://github.com/miloyip/rapidjson)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
conflicts=(fossilize)

pkgver() {
  cd Fossilize
  printf '0.0.0+%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse HEAD | head -c10)
}

prepare() {
  cd Fossilize
  git submodule init
  git config submodule."cli/SPIRV-Cross".url "$srcdir/SPIRV-Cross"
  git config submodule."cli/SPIRV-Headers".url "$srcdir/SPIRV-Headers"
  git config submodule."cli/SPIRV-Tools".url "$srcdir/SPIRV-Tools"
  git config submodule."cli/dirent".url "$srcdir/dirent"
  git config submodule."cli/volk".url "$srcdir/volk"
  git config submodule."rapidjson".url "$srcdir/rapidjson"
  git submodule update
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
