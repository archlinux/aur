# Maintainer: Alexander Jacocks <alexander@redhat.com>

pkgname="axpbox"
pkgver=1.1.1
pkgrel=1
pkgdesc="Alpha emulator"
arch=('i686' 'x86_64')
url="https://github.com/lenticularis39/axpbox"
license=('GPLv2')
depends=('libpcap' 'sdl2' 'openbsd-netcat')
makedepends=('cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('e475e491fa766a6622fa4ed79b8b4d6e6430b6bdb7cf20f525c8b9b4a9d671a4')

build() {
  cd "${pkgname}-${pkgver}"
  cmake -E make_directory build
  cd build
  cmake .. -DCMAKE_C_COMPILER="clang" -DCMAKE_CXX_COMPILER="clang++" -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-Wall"
  MAKEFLAGS=-j"$(nproc)" cmake --build . --config Release
}

check() {
  cd "${pkgname}-${pkgver}"
  test/run
}

package() {
  echo "Entering directory $srcdir/${pkgname%-*}/build."
  cd "$srcdir/${pkgname}-${pkgver}/build"
  install -d "$pkgdir/usr/bin"
  install axpbox "$pkgdir/usr/bin/axpbox"

  echo "Entering directory $srcdir/${pkgname}-${pkgver}."
  cd "$srcdir/${pkgname}-${pkgver}"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -D -t "$pkgdir/usr/share/doc/$pkgname" *.md
}
