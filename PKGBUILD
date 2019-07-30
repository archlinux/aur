# Contributor: Angelo Theodorou <encelo@gmail.com>

pkgname=ncinvaders-git
pkgver=r2.9c3d273
pkgrel=1
pkgdesc="A simplified version of Space Invaders made with the nCine"
arch=('i686' 'x86_64')
url="http://ncine.github.io"
license=('MIT')
depends=('ncine')
makedepends=('git' 'cmake')
conflicts=('ncinvaders')
provides=('ncinvaders')
options=(!strip)
source=('git://github.com/nCine/ncInvaders')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/ncInvaders"
  ( set -o pipefail
    git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  git clone https://github.com/nCine/ncInvaders-data || git -C ncInvaders-data pull
}

build() {
  mkdir -p build && cd build

  cmake ../ncInvaders\
        -DCMAKE_BUILD_TYPE=Release\
        -DPACKAGE_BUILD_ANDROID=OFF\
        -DPACKAGE_STRIP_BINARIES=ON\
        -DPACKAGE_DEFAULT_DATA_DIR=/usr/share/ncinvaders/data\
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR=$pkgdir PREFIX= install
  install -Dm0644 $srcdir/ncInvaders/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
