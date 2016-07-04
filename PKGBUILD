# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Knut Franke <Knut.Franke ad gmx dot de>
# Contributor: Olaf Leidinger <leidola at newcon dot de>
# Contributor: Robal <nigrantis.tigris at gmail dot com>
# Contributor: Alexander <chronischzuspaet at gmail dot com> Kempen

pkgname=scidavis
pkgver=1.D13
pkgrel=1
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of QtiPlot"
arch=('i686' 'x86_64')
url="http://scidavis.sourceforge.net/"
license=('GPL')
makedepends=('boost' 'cmake')
depends=('gsl' 'glu' 'mesa' 'muparser' 'python2-pyqt4' 'shared-mime-info'
         'qt-assistant-compat' 'qwt5' 'qwtplot3d')
source=(http://prdownloads.sourceforge.net/sourceforge/scidavis/${pkgname}.${pkgver}.tar.gz
        scidavis-tableitem.patch
        scidavis-python.patch
        scidavis-qwt5.patch)
md5sums=('8400d1b48dcb24068d2e371b9021db7d'
         '8cf280ba7d60e2d0664edfb0919ceb09'
         'c8c0606a58ece369cf5b09276559b830'
         '6b6c88d1e26b39cde2b88bb71f5fc3ae')
install=${pkgname}.install

prepare() {
  # python patch
  patch -p0 -i "scidavis-python.patch"
  # fix qwt
  patch -p0 -i "scidavis-qwt5.patch"
  # fix table item attributes
  patch -p0 -i "scidavis-tableitem.patch"
}

build() {
  cd "${pkgname}.${pkgver}"
  qmake-qt4
  make
}

package() {
  cd "${pkgname}.${pkgver}"
  make INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install

  # remove liborigin files since it uses static library
  rm -rf "${pkgdir}/usr/local"
}

