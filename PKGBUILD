# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=spirv-tools-git
pkgver=r3643.d5f69db
pkgrel=1
epoch=1
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
  cd SPIRV-Tools
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
