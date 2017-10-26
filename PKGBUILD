# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tinyxml-git
pkgver=5.0.1.r78.g8b83b23
pkgrel=1
pkgdesc="A simple, small, efficient, C++ XML parser"
arch=('i686' 'x86_64')
url="http://grinninglizard.com/tinyxml2/index.html"
license=('zlib')
depends=('glibc')
makedepends=('git' 'cmake')
provides=('tinyxml')
conflicts=('tinyxml')
options=('staticlibs')
source=("git+https://github.com/leethomason/tinyxml2.git")
sha256sums=('SKIP')


pkgver() {
  cd "tinyxml2"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "tinyxml2"

  sed -n '/Original code/,/distribution./p' "tinyxml2.cpp" > "LICENSE"

  mkdir -p "_build"
  cd "_build"
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_STATIC_LIBS=ON -DCMAKE_BUILD_TYPE=Release ../
  make
}

check() {
  cd "tinyxml2/_build"

  make test
}

package() {
  cd "tinyxml2/_build"

  make DESTDIR="$pkgdir" install
  install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/tinyxml/LICENSE"
}
