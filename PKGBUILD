# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=spirv-tools-nocheck-git
pkgver=2020.6+14.g17ffa89097
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
  git -C SPIRV-Tools describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DSPIRV-Headers_SOURCE_DIR="$srcdir/SPIRV-Headers" \
    -DBUILD_SHARED_LIBS=ON \
    -DSPIRV_TOOLS_BUILD_STATIC=OFF \
    -DSPIRV_WERROR=OFF \
    -S SPIRV-Tools -B build
  ninja $NINJAFLAGS -C build
}

#check() {
#  ninja $NINJAFLAGS -C build test
#}

package() {
  DESTDIR="$pkgdir" ninja $NINJAFLAGS -C build install
  install -Dm644 "$srcdir"/SPIRV-Tools/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
