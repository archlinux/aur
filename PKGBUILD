# Maintainer: Eric Engestrom <aur@engestrom.ch>
# Maintainer: Yevhenii Kolesnikov <sigexp.acc at gmail dot com>

pkgname=gfxreconstruct
pkgver=0.9.18
pkgrel=1
pkgdesc='Graphics API Capture and Replay Tools for Reconstructing Graphics Application Behavior'
arch=('x86_64' 'aarch64')
url='https://github.com/LunarG/gfxreconstruct'
license=('Apache')
depends=('python' 'libx11' 'libxcb' 'xcb-util-keysyms' 'wayland' 'libxrandr' 'zlib' 'lz4' 'zstd')
makedepends=('cmake>=3.4' 'git' 'ninja')
source=("$pkgname::git+$url#tag=v$pkgver"
        'git+https://github.com/KhronosGroup/Vulkan-Headers')
sha256sums=('SKIP'
            'SKIP')

# On x86_64 we also build the lib for x86_32
if [ "$CARCH" = x86_64 ]
then
  depends+=('lib32-libx11' 'lib32-libxcb' 'lib32-wayland' 'lib32-libxrandr' 'lib32-zlib' 'lib32-lz4' 'lib32-zstd')
fi

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.'external/Vulkan-Headers'.url "$srcdir/Vulkan-Headers"
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -S $pkgname -B build \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr
  cmake --build build

  if [ "$CARCH" = x86_64 ]
  then
    CFLAGS="$CFLAGS -m32" \
    CXXFLAGS="$CXXFLAGS -m32" \
    LDFLAGS="$LDFLAGS -m32" \
    PKG_CONFIG_PATH='/usr/lib32/pkgconfig' \
    cmake -S $pkgname -B build_32 \
      -G Ninja \
      -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_INSTALL_PREFIX=/usr
    cmake --build build_32
  fi
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  if [ "$CARCH" = x86_64 ]
  then
    install -Dm755 build_32/layer/libVkLayer_gfxreconstruct.so \
      "$pkgdir"/usr/lib32/libVkLayer_gfxreconstruct.so
  fi

  msg2 'Remove .py file extension from files that are going to /usr/bin/'
  for f in $pkgdir/usr/bin/*.py; do
    mv -v $f ${f%.py}
  done
}
