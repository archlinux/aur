# Maintainer: Patrik Bachan <patrikbachan at gmail dot com>
pkgname=serialplot-hg
_pkgname=serialplot
pkgver=794+.9d8cc029351b+
pkgrel=1
pkgdesc="Small and simple software for plotting data from serial port in realtime"
arch=('i686' 'x86_64')
url="https://bitbucket.org/hyOzd/serialplot"
license=('GPL3')
depends=('qwt' 'qt5-base' 'qt5-serialport' 'hicolor-icon-theme')
makedepends=('mercurial' 'cmake')
provides=('serialplot')
conflicts=('serialplot')
source=('hg+https://bitbucket.org/hyOzd/serialplot')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(hg identify -n).$(hg identify -i)
}

prepare() {
  cd "$srcdir/$_pkgname"
  #disable update checking, otherwise app crashes
  sed -i -e 's/if (isChecking()) return/return/g' src/updatechecker.cpp
}

build() {
  cd "$srcdir/$_pkgname"
  mkdir build
  cd build
  cmake -DBUILD_QWT=false -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}
package() {
  cd "$srcdir/$_pkgname"
  cd build
  make DESTDIR="${pkgdir}" install
}
