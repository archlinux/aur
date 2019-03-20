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
source=('hg+https://bitbucket.org/hyOzd/serialplot#branch=default'
        'update_check_disable.patch')
sha256sums=('SKIP'
            '116736d9471b5e0d283c264c1df8db5e4eb5e927839db7eee0022ab7b9177961')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(hg identify -n).$(hg identify -i)
}

prepare() {
  cd "$srcdir"
  #disable update checking, otherwise app crashes
  #this is dirty fix, just immediately returning from update function
  patch --forward --strip=1 --input="${srcdir}/update_check_disable.patch"
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
