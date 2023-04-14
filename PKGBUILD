# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=spirv-tools-git
pkgver=2023.2+42.gd5f69dba55
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
makedepends=('cmake' 'python' 'git' 'spirv-headers-git')
options=('staticlibs')
conflicts=('spirv-tools')
provides=('spirv-tools')

pkgver() {

  git -C SPIRV-Tools describe --tags --match 'v*.*' --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

build() {

  cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_INSTALL_LIBDIR=lib \
    -D SPIRV-Headers_SOURCE_DIR=/usr/ \
    -D BUILD_SHARED_LIBS=ON \
    -D SPIRV_TOOLS_BUILD_STATIC=OFF \
    -D SPIRV_WERROR=OFF \
    -S SPIRV-Tools -B build
  make -C build
}

check() {
    make -C build test
}

package() {
  
  make -C build DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir"/SPIRV-Tools/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
