# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libjpeg-turbo-git
pkgver=2.0.4.r16.gae87a958
pkgrel=2
pkgdesc="JPEG codec with SIMD accelerated compression and decompression"
arch=('i686' 'x86_64')
url="https://libjpeg-turbo.org/"
license=('custom')
depends=('glibc')
makedepends=('git' 'cmake' 'nasm')
provides=('libjpeg-turbo' 'libjpeg')
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

  mkdir -p "_build" && cd "_build"
  cmake \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_JPEG8=1 \
    ../
  make
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
