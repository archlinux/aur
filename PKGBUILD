# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Eric Engestrom <aur@engestrom.ch>
# Contributor: Yevhenii Kolesnikov <sigexp.acc at gmail dot com>

pkgname=gfxreconstruct
pkgver=1.0.4
pkgrel=1
pkgdesc="Graphics API Capture and Replay Tools for Reconstructing Graphics Application Behavior"
arch=(x86_64 aarch64)
url="https://github.com/LunarG/gfxreconstruct"
license=(Apache-2.0)
depends=(python zlib lz4 zstd gcc-libs glibc)
makedepends=(cmake git ninja xcb-util-keysyms libx11 libxcb wayland libxrandr)
source=("git+https://github.com/LunarG/gfxreconstruct.git#tag=v$pkgver"
        "git+https://github.com/KhronosGroup/Vulkan-Headers.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.'external/Vulkan-Headers'.url "$srcdir/Vulkan-Headers"
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -S gfxreconstruct -B build -Wno-dev \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # 'Remove .py file extension from files that are going to /usr/bin/'
  for f in $pkgdir/usr/bin/*.py; do
    mv -v $f ${f%.py}
  done
}
