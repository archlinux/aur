# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="exfat-resize"
pkgver=2.1.2
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
b2sums=('2d775a560d91290c02938ab1e56c9f7044b0c5a1946b4558fa35c7d73818e559d76322cf14ccbf5ac3c268c2d6bb7ff3ba7653946f1f714f610176eedd3fe219')

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
