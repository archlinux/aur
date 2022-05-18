# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libjpeg-turbo-git
pkgver=2.1.3.r16.g290ddbf7
pkgrel=2
pkgdesc="JPEG codec with SIMD accelerated compression and decompression"
arch=('i686' 'x86_64')
url="https://libjpeg-turbo.org/"
license=('custom')
depends=('glibc')
makedepends=('git' 'cmake' 'nasm')
provides=("libjpeg-turbo=$pkgver" 'libjpeg' 'libjpeg.so' 'libturbojpeg.so')
conflicts=('libjpeg-turbo')
options=('staticlibs')
source=("git+https://github.com/libjpeg-turbo/libjpeg-turbo.git")
sha256sums=('SKIP')


pkgver() {
  cd "libjpeg-turbo"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libjpeg-turbo"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
    -DWITH_JPEG8=1 \
    ./
  make -C "_build"
}

check() {
  cd "libjpeg-turbo"

  make -C "_build" test
}

package() {
  cd "libjpeg-turbo"

  make \
    -C "_build" \
    DESTDIR="$pkgdir" \
    docdir="/usr/share/doc/libjpeg-turbo" \
    exampledir="/usr/share/doc/libjpeg-turbo" \
    install

  install -Dm644 "jpegint.h" "$pkgdir/usr/include"  # required by other software
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/libjpeg-turbo"
}
