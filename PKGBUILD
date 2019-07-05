# Maintainer: Mirko Scholz
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Knut Franke <Knut.Franke ad gmx dot de>
# Contributor: Olaf Leidinger <leidola at newcon dot de>
# Contributor: Robal <nigrantis.tigris at gmail dot com>
# Contributor: Alexander <chronischzuspaet at gmail dot com> Kempen

# see https://svnweb.freebsd.org/ports/head/science/scidavis/Makefile?view=markup

_pkgname=scidavis
pkgname=scidavis-qt5
pkgver=1.25
pkgrel=1
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of QtiPlot. Qt5 port"
arch=('x86_64')
url="http://scidavis.sourceforge.net/"
license=('GPL')
makedepends=('boost' 'cmake' 'qt5-tools')
depends=('gsl' 'glu' 'mesa' 'muparser' 'shared-mime-info'
         'desktop-file-utils' 'hicolor-icon-theme'
         'qwt5-qt5' 'qwtplot3d-qt5')
conflicts=('scidavis')
source=("https://prdownloads.sourceforge.net/sourceforge/scidavis/${_pkgname}-${pkgver}.tar.gz"
future_absolute.patch
)
sha512sums=('23616614361935d0aa9fdd51a582a8ab0d035f6ab6dfc23548964b2f3aca1122a013577b7743574fd8f32acdf88e2e719c2fc358f8df9394741065055491566b'
            '94a8c89df7d178d679e1304d545ea93cee2c6e687d593718947228ac3d89a9dc65424799a483d47f31653a71e7f4cafe676303906cf42b89e615cdc944cb2dea')

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/future_absolute.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  qmake-qt5 \
	CONFIG+="liborigin" \
	INCLUDEPATH+="/usr/include/qt/qwt5-qt5" \
	INCLUDEPATH+="/usr/include/qt/qwtplot3d-qt5" \
	LIBS+="-lqwt5-qt5 -lqwtplot3d-qt5" \
	QMAKE_CXXFLAGS=-fpermissive
  make qmake
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install

  # remove liborigin files since it uses static library
  rm -rf "${pkgdir}/usr/local"

  # install translations (it looks like it does not provide target to do it)
  install -dm755 "${pkgdir}/usr/share/scidavis/translations/"
  find "scidavis/translations/" -name '*.qm' -type f -exec \
      install -Dm644 {} "${pkgdir}/usr/share/scidavis/translations/" \;
}
