# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="exfat-resize"
pkgver=2.1.0
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
b2sums=('533c8ba32117731bbb2050c2d34f4c9f33d6d1601a828ae5f25f3bcada200a8be0920b7d766141fa4889db18217b7c20d938e47d1811a14b20bde2afad6ea93c')

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
