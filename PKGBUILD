# Maintainer:  AstroFloyd  <AstroFloyd gmail>
# Contributor: James Duley <jagduley gmail>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Gunther Schulz < mail at guntherschulz.de >
# Contributor: Kévin Guilloy <kevin at guilloy dot ath dot cx>
_pkgname=qwtpolar
pkgname=${_pkgname}-qt5
pkgver=1.1.1
pkgrel=2
pkgdesc="A Qwt library that contains classes for displaying values on a polar coordinate system"
arch=('i686' 'x86_64')
url="http://qwtpolar.sourceforge.net/"
license=('custom:Qwt License, Version 1.0')
depends=('qwt-qt5')
provides=('qwtpolar')
conflicts=('qwtpolar'
           'qwtpolar-svn'
           'qwtpolar-svn-qt4')
source=("http://sourceforge.net/projects/qwtpolar/files/qwtpolar/${pkgver}/qwtpolar-${pkgver}.tar.bz2")
md5sums=('0f549b51a06fa0f0f43b12f3269fe206')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  sed -i 's,/usr/local.*,/usr,' ${_pkgname}config.pri
  sed -i "s,/doc,/share/doc/$_pkgname/," ${_pkgname}config.pri
  sed -i "s,/include,/include/$_pkgname/," ${_pkgname}config.pri
  sed -i 's,/features,/lib/qt/mkspecs/features,' ${_pkgname}config.pri
  sed -i 's,/plugins,/lib/qt/plugins,' ${_pkgname}config.pri
  sed -i '/Qwt.*Examples/d' ${_pkgname}config.pri

  qmake-qt5
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make INSTALL_ROOT="${pkgdir}"/ install

  # move man pages
  mv "${pkgdir}"/usr/share/doc/${_pkgname}/man/ "${pkgdir}"/usr/share/

  # remove conflicting file with qwt
  rm ${pkgdir}/usr/share/man/man3/qwtlicense.3
}
