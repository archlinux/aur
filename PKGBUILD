# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Eric Engestrom <aur@engestrom.ch>
# Contributor: Yevhenii Kolesnikov <sigexp.acc at gmail dot com>

pkgname=lib32-gfxreconstruct
pkgver=1.0.4
pkgrel=1
pkgdesc="Graphics API Capture and Replay Tools for Reconstructing Graphics Application Behavior"
arch=(x86_64 aarch64)
url="https://github.com/LunarG/gfxreconstruct"
license=(Apache-2.0)
depends=(gfxreconstruct lib32-libx11 lib32-libxcb lib32-wayland lib32-libxrandr lib32-zlib lib32-lz4 lib32-zstd)
makedepends=(cmake git ninja xcb-util-keysyms)
source=("git+https://github.com/LunarG/gfxreconstruct.git#tag=v$pkgver"
        "git+https://github.com/KhronosGroup/Vulkan-Headers.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd gfxreconstruct
  git submodule init
  git config submodule.'external/Vulkan-Headers'.url "$srcdir/Vulkan-Headers"
  git -c protocol.file.allow=always submodule update
}

build() {
  CFLAGS="$CFLAGS -m32" \
  CXXFLAGS="$CXXFLAGS -m32" \
  LDFLAGS="$LDFLAGS -m32" \
  PKG_CONFIG_PATH='/usr/lib32/pkgconfig' \
  cmake -S gfxreconstruct -B build -Wno-dev \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  install -Dm755 build/layer/libVkLayer_gfxreconstruct.so \
    "$pkgdir"/usr/lib32/libVkLayer_gfxreconstruct.so
}
