_gitname=x264-Mod-by-Patman
pkgname=x264-patmanmod-git
pkgver=0.165.3223+40.r3.g0f48e006
pkgrel=1
epoch=3
pkgdesc="Patman-modified x264 build with shared library, PIC, LTO, and system-libx264"
arch=('any')
url="https://github.com/Patman86/x264-Mod-by-Patman"
license=('GPL')
makedepends=('git' 'make' 'nasm')
conflicts=('libx264' 'libx264-10bit' 'libx264-all' 'x264-tmod-git' 'x264-git')
provides=('x264' 'libx264' 'libx264.so' "${pkgname}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
  cd $_gitname

    BASE_CFLAGS="-O3 -march=native -mtune=native \
            -falign-functions=32 -falign-loops=32 \
            -fno-math-errno -fno-trapping-math \
            -fno-semantic-interposition \
            -fomit-frame-pointer -fno-plt \
            -pipe -flto -Wall -Wno-unused \
            -fstrict-aliasing -fno-rtti -fno-exceptions \
            -fmerge-all-constants -ffunction-sections \
            -fdata-sections"

    BASE_CXXFLAGS="$BASE_CFLAGS"
    BASE_LDFLAGS="-Wl,--icf=safe -Wl,--gc-sections -Wl,-O3 -flto -fno-plt"

    # Clang-only flags
    CLANG_EXTRA_CFLAGS="-fstrict-vtable-pointers -fno-asynchronous-unwind-tables"
    CLANG_EXTRA_CXXFLAGS="$CLANG_EXTRA_CFLAGS"
    CLANG_EXTRA_LDFLAGS="-fuse-ld=lld"

    # Detect compiler
    if command -v clang >/dev/null 2>&1; then
        export CC=clang
        export CXX=clang++
        export CFLAGS="$BASE_CFLAGS $CLANG_EXTRA_CFLAGS"
        export CXXFLAGS="$BASE_CXXFLAGS $CLANG_EXTRA_CXXFLAGS"
        export LDFLAGS="$BASE_LDFLAGS $CLANG_EXTRA_LDFLAGS"
    else
        export CC=gcc
        export CXX=g++
        export CFLAGS="$BASE_CFLAGS"
        export CXXFLAGS="$BASE_CXXFLAGS"
        export LDFLAGS="$BASE_LDFLAGS"
    fi

  sh configure \
    --enable-pic \
    --enable-shared \
    --enable-lto \
    --system-libx264

  make -j$(nproc)
}

package() {
  cd $_gitname

  # Install binary
  install -Dm755 x264 "$pkgdir/usr/bin/x264"

  # Install shared library
  install -Dm755 libx264.so.* "$pkgdir/usr/lib/libx264.so.165"
  ln -s libx264.so.165 "$pkgdir/usr/lib/libx264.so"

  # Install pkgconfig file
  install -Dm644 x264.pc "$pkgdir/usr/lib/pkgconfig/x264.pc"

  # Install headers
  install -Dm644 x264.h "$pkgdir/usr/include/x264.h"

  # Rename config.h → x264_config.h
  install -Dm644 config.h "$pkgdir/usr/include/x264_config.h"
}
