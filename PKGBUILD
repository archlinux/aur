# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=spirv-tools-git
pkgver=2023.1+8.gcdc4e528f3
pkgrel=1
pkgdesc='API and commands for processing SPIR-V modules'
url='https://github.com/KhronosGroup/SPIRV-Tools'
arch=('i686' 'x86_64')
license=('custom')
groups=('vulkan-devel')
source=('git+https://github.com/KhronosGroup/SPIRV-Tools'
)
sha1sums=('SKIP'
)
depends=('gcc-libs' 'sh')
makedepends=('cmake' 'ninja' 'python' 'git' 'spirv-headers-git')
options=('staticlibs')
conflicts=('spirv-tools')
provides=('spirv-tools')

pkgver() {
  git -C SPIRV-Tools describe --tags --match 'v*.*' --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -D SPIRV-Headers_SOURCE_DIR=/usr/ \
    -DBUILD_SHARED_LIBS=ON \
    -DSPIRV_TOOLS_BUILD_STATIC=OFF \
    -DSPIRV_WERROR=OFF \
    -S SPIRV-Tools -B build
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$srcdir"/SPIRV-Tools/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
