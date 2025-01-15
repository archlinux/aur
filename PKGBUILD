# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Yevhenii Kolesnikov <sigexp.acc at gmail dot com>

pkgname=gfxreconstruct-git
pkgver=1.4.304.0.r39.g79e09199
pkgrel=1
pkgdesc="Graphics API capture and replay tools for reconstructing graphics application behavior"
arch=(x86_64)
url="https://github.com/LunarG/gfxreconstruct"
license=(MIT)
depends=(glibc gcc-libs python zlib lz4 zstd)
makedepends=(git cmake libx11 libxcb wayland xcb-util-keysyms)
provides=(gfxreconstruct)
conflicts=(gfxreconstruct)
source=("git+https://github.com/LunarG/gfxreconstruct.git"
        "git+https://github.com/KhronosGroup/Vulkan-Headers.git"
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git"
        "git+https://github.com/KhronosGroup/SPIRV-Reflect.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd gfxreconstruct
  git describe --long --tags | sed 's/^vulkan-sdk-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd gfxreconstruct
  git submodule init
  git config submodule.external/Vulkan-Headers.url "$srcdir/Vulkan-Headers"
  git config submodule.external/SPIRV-Headers.url "$srcdir/SPIRV-Headers"
  git config submodule.external/SPIRV-Reflect.url "$srcdir/SPIRV-Reflect"
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -B build -S "gfxreconstruct" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -D gfxreconstruct/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Remove .py file extension from files that are going to /usr/bin/
  for f in ${pkgdir}/usr/bin/*.py; do
    mv -v $f `echo $f | sed 's/\.py//'`
  done
}
