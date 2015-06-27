# Maintainer: Lukas Jirkovsky <l.jirkovsky AT gmail.com>
pkgname=photivo-hg
pkgver=1113.66a8c1082d88
pkgrel=1
pkgdesc="Free and open source photo processor"
arch=('i686' 'x86_64')
url="http://photivo.org/"
license=('GPL3')
depends=('exiv2' 'qt4' 'lcms2' 'fftw' 'graphicsmagick' 'lensfun' 'liblqr' 'shared-mime-info')
optdepends=('gimp: Gimp plugins' 'python2: Gimp to Photivo plugin')
makedepends=('mercurial' 'gimp')
provides=('photivo')
conflicts=('photivo')
install=photivo.install
source=('hg+https://code.google.com/p/photivo/')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/photivo"
  echo $(hg identify -n).$(hg identify -i)
}

prepare() {
  cd "$srcdir/photivo"

  # fix the "Gimp to Photivo" plugin
  sed -i -e 's|\x0D$||' -e 's|#!.*|#!/usr/bin/python2|' "mm extern photivo.py"
}

build() {
  cd "$srcdir/photivo"

  export INCLUDEPATHS="/usr/include/lensfun"
  qmake-qt4 PREFIX=/usr CONFIG+=WithGimp
  make
}

package() {
  cd "$srcdir/photivo"

  make INSTALL_ROOT="$pkgdir" install
  rm -rf "$pkgdir"/home

  # GIMP integration
  install -D -m755 ptGimp "$pkgdir/usr/lib/gimp/2.0/plug-ins/ptGimp"
  install -D -m755 "mm extern photivo.py" "$pkgdir/usr/lib/gimp/2.0/plug-ins/mm-extern-photivo.py"
}
