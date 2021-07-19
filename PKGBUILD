# Maintainer: Alexander Jacocks <alexander@redhat.com>

pkgname="axpbox-git"
pkgver=1.0.0.12.g35bdcd3
pkgrel=1
pkgdesc="AXPbox Alpha emulator"
arch=('i686' 'x86_64')
url="https://github.com/lenticularis39/axpbox"
license=('GPLv2')
depends=('libpcap' 'sdl2' 'openbsd-netcat')
makedepends=('cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('git+https://github.com/lenticularis39/axpbox.git')
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  printf "%s" "$(git describe --long --tags | sed 's/v//; s/-/./g')"
}

build() {
  cd "${pkgname%-*}"
  cmake -E make_directory build
  cd build
  cmake .. -DCMAKE_C_COMPILER="clang" -DCMAKE_CXX_COMPILER="clang++" -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-Wall"
  MAKEFLAGS=-j"$(nproc)" cmake --build . --config Release
}

check() {
  cd "${pkgname%-*}"
  test/run
}

package() {
  echo "Entering directory $srcdir/${pkgname%-*}/build."
  cd "$srcdir/${pkgname%-*}/build"
  install -d "$pkgdir/usr/bin"
  install axpbox "$pkgdir/usr/bin/axpbox"

  echo "Entering directory $srcdir/${pkgname%-*}."
  cd "$srcdir/${pkgname%-*}"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -D -t "$pkgdir/usr/share/doc/$pkgname" *.md
}
