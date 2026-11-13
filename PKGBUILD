# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="exfat-resize"
pkgver=2.1.1
pkgrel=1
pkgdesc="Grow an existing exFAT filesystem in a regular file or on a raw block device"
arch=("x86_64" "aarch64")
url="https://github.com/huven/exfat-resize"
license=("MIT")
depends=(
  "glibc"
)
makedepends=(
  "cmake"
)
options=(
  # libexfat_resize.a is the only library form upstream ships, and the installed header and CMake package files are useless without it
  "staticlibs"
  #  GCC LTO objects in that archive cannot be linked by consumers using a different toolchain
  "!lto"
)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('ff0f53d8d3d192cf8dd25b1112b229ef106fa02791ae25f0a3b66faea323fdc9b29908d4ff2524ef9e6ffb8ac3e129a2f2b5cbaa8c2eb5f7df4d14dc63a1f765')

build(){
  cmake -S "$pkgname-$pkgver" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_DOCDIR="share/doc/$pkgname" \
    -DEXFAT_RESIZE_BUILD_CLI=ON \
    -DEXFAT_RESIZE_BUILD_TESTS=ON \
    -Wno-dev
  cmake --build build
}

package(){
  DESTDIR="$pkgdir" cmake --install build
  install -D -m 644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
