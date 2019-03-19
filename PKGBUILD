# Maintainer: Patrik Bachan <patrikbachan at gmail dot com>
pkgname=serialplot-hg
_pkgname=serialplot
pkgver=796+.f5f0a29e6433+
pkgrel=1
pkgdesc="Small and simple software for plotting data from serial port in realtime"
arch=('i686' 'x86_64')
url="https://bitbucket.org/hyOzd/serialplot"
license=('GPL3')
depends=('qwt' 'qt5-base' 'qt5-serialport' 'hicolor-icon-theme')
makedepends=('mercurial' 'cmake')
provides=('serialplot')
conflicts=('serialplot')
source=('hg+https://bitbucket.org/hyOzd/serialplot'
        'cmake_qwt.patch'
        'update_check_disable.patch')
sha256sums=('SKIP'
            'b1508ee32f79c82ad6e1749ddc79c33e4af3e3178c0e8e67c9011eda040c8652'
            '116736d9471b5e0d283c264c1df8db5e4eb5e927839db7eee0022ab7b9177961')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(hg identify -n).$(hg identify -i)
}

prepare() {
  cd "$srcdir"
  #disable update checking, otherwise app crashes
  #this is dirty fix
  patch --forward --strip=1 --input="${srcdir}/update_check_disable.patch"
  #patch qwt search script
  #https://bitbucket.org/hyOzd/serialplot/issues/15
  cd "$srcdir"
  patch --forward --strip=1 --input="${srcdir}/cmake_qwt.patch"
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
