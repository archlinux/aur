# Contributor: Angelo Theodorou <encelo@gmail.com>

pkgname=ncpong-git
pkgver=r37.42a14b6
pkgrel=1
pkgdesc="An example game made with the nCine"
arch=('i686' 'x86_64')
url="http://ncine.github.io"
license=('MIT')
depends=('ncine')
makedepends=('git' 'cmake')
conflicts=('ncpong')
provides=('ncpong')
options=(!strip)
source=('git://github.com/nCine/ncPong')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/ncPong"
  ( set -o pipefail
    git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  git clone https://github.com/nCine/ncPong-data || git -C ncPong-data pull
}

build() {
  mkdir -p build && cd build

  cmake ../ncPong\
        -DCMAKE_BUILD_TYPE=Release\
        -DPACKAGE_BUILD_ANDROID=OFF\
        -DPACKAGE_STRIP_BINARIES=ON\
        -DPACKAGE_DEFAULT_DATA_DIR=/usr/share/ncpong/data\
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR=$pkgdir PREFIX= install
  install -Dm0644 $srcdir/ncPong/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
