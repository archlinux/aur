# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=spirv-tools-git
pkgver=r1864.2af6ffae826426cff344
pkgrel=1
pkgdesc='API and commands for processing SPIR-V modules'
url='https://github.com/KhronosGroup/SPIRV-Tools'
arch=('i686' 'x86_64')
license=('custom')
groups=('vulkan-devel')
source=('git+https://github.com/KhronosGroup/SPIRV-Tools'
        'git+https://github.com/KhronosGroup/SPIRV-Headers')
sha1sums=('SKIP'
          'SKIP')
depends=(gcc-libs spirv-headers)
makedepends=('cmake' 'ninja' 'python' 'git')
options=('staticlibs')
conflicts=('spirv-tools')
provides=('spirv-tools')

pkgver() {
  cd "${srcdir}"/SPIRV-Tools
  printf "r%d.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DSPIRV-Headers_SOURCE_DIR="$srcdir/SPIRV-Headers" \
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
