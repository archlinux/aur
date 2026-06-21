pkgname=x264-patmanmod-git
pkgver=latest
pkgrel=1
pkgdesc="Patman-modified x264 build with shared library, PIC, LTO, and system-libx264"
arch=('x86_64')
url="https://github.com/Patman86/x264-Mod-by-Patman"
license=('GPL')
depends=('glibc')
makedepends=('git' 'nasm')
conflicts=('libx264' 'libx264-10bit' 'libx264-all' 'x264-tmod-git' 'x264-git')
provides=('x264' 'libx264' 'libx264.so' "${pkgname}")
source=("git+https://github.com/Patman86/x264-Mod-by-Patman.git")
sha256sums=('SKIP')

pkgver() {
  cd x264-Mod-by-Patman
  git describe --long --tags --always | sed 's/^v//;s/-/./g'
}

build() {
  cd x264-Mod-by-Patman

  export CFLAGS="-O3 -march=native -mtune=native \
                 -fno-math-errno -fno-trapping-math \
                 -fomit-frame-pointer -fno-semantic-interposition \
                 -pipe"

  export CXXFLAGS="$CFLAGS"

  export LDFLAGS="-fno-plt -Wl,-O1"

  ./configure \
    --enable-pic \
    --enable-shared \
    --enable-lto \
    --system-libx264

  make -j$(nproc)
}

package() {
  cd x264-Mod-by-Patman

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
