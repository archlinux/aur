# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tinyxml2-git
pkgver=11.0.0.r8.ge6caeae
pkgrel=1
pkgdesc="Simple, small, efficient, C++ XML parser"
arch=('i686' 'x86_64')
url="https://leethomason.github.io/tinyxml2/"
license=('Zlib')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("tinyxml2=$pkgver")
conflicts=('tinyxml2')
source=("git+https://github.com/leethomason/tinyxml2.git")
sha256sums=('SKIP')


pkgver() {
  cd "tinyxml2"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "tinyxml2"

  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -Dtinyxml2_SHARED_LIBS=ON \
    ./
  cmake --build "_build"
}

check() {
  cd "tinyxml2"

  #cmake --build "_build" --target test
}

package() {
  cd "tinyxml2"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/tinyxml2"
}
