# Maintainer: Angelo Theodorou <encelo@gmail.com>

pkgname=ncline-git
pkgver=r10.9693301
pkgrel=1
pkgdesc="The nCine command line tool"
arch=('i686' 'x86_64')
url="http://ncine.github.io"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake')
conflicts=('ncline')
provides=('ncline')
source=('git://github.com/nCine/ncline')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/ncline"
  ( set -o pipefail
    git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  mkdir -p build && cd build

  cmake ../ncline -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR=$pkgdir PREFIX= install
  install -Dm0644 $srcdir/ncline/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
