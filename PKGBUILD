# Maintainer: SaultDon <sault.don gmail>
# Contributor: Gunther Schulz < mail at guntherschulz.de > 
# Contributor: Kévin Guilloy <kevin at guilloy dot ath dot cx>
pkgname=qwtpolar
_pkgver=1.1
pkgver=1.1
pkgrel=1
pkgdesc="A Qwt library that contains classes for displaying values on a polar coordinate system."
arch=('i686' 'x86_64')
url="http://qwtpolar.sourceforge.net/"
license=('custom:Qwt License, Version 1.0')
depends=('qt4>=4.8.5'
         'qwt>=6.1.0')
makedepends=('subversion')
provides=("$pkgname=$pkgver")
conflicts=('qwtpolar'
           'qwtpolar-svn'
           'qwtpolar-svn-qt4')
source=("qwtpolar::svn+https://svn.code.sf.net/p/qwtpolar/code/branches/qwtpolar-${_pkgver}")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local ver="$(svnversion)"
  printf "%s.r%s" "${_pkgver}" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$pkgname"

  sed -i -e 's/$${QWT_POLAR_INSTALL_PREFIX}\/doc/\/usr\/share\/doc\/qwt\//' qwtpolarconfig.pri
  sed -i -e 's/$${QWT_POLAR_INSTALL_PREFIX}\/include/\/usr\/include\/qwt\//' qwtpolarconfig.pri
  sed -i -e 's/$${QWT_POLAR_INSTALL_PREFIX}\/lib/\/usr\/lib\//' qwtpolarconfig.pri
  sed -i -e 's/$${QWT_POLAR_INSTALL_PREFIX}\/features/\/usr\/share\/qwt\/features\//' qwtpolarconfig.pri
  sed -i -e 's/^.*QwtPolarDesigner//' qwtpolarconfig.pri
  sed -i -e 's/^.*QwtPolarExamples//' qwtpolarconfig.pri
  echo "INCLUDEPATH += /usr/include" >> qwtpolarbuild.pri

  qmake-qt4 qwtpolar.pro
  make
}

package() {
  cd "$srcdir/$pkgname"

  make INSTALL_ROOT="${pkgdir}"/ install
}