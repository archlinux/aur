# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="exfat-resize"
pkgver=1.0.1
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
b2sums=('a49eeafcf89b9f3fc9ff5727c0bd3b8e402ad78308dac1cbc6c5b1f3a61349cdc942b261433189de08e7ce8856d243750a07d566c5733014bda986022c1fffbe')

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
