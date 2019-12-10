# Maintainer: Mirko Scholz
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Knut Franke <Knut.Franke ad gmx dot de>
# Contributor: Olaf Leidinger <leidola at newcon dot de>
# Contributor: Robal <nigrantis.tigris at gmail dot com>
# Contributor: Alexander <chronischzuspaet at gmail dot com> Kempen

# see https://svnweb.freebsd.org/ports/head/science/scidavis/Makefile?view=markup

_pkgname=scidavis
pkgname=scidavis-qt5
pkgver=1.26
_commit=1.26
pkgrel=1
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of QtiPlot. Qt5 port"
arch=('x86_64')
url="http://scidavis.sourceforge.net/"
license=('GPL')
makedepends=('boost' 'cmake' 'qt5-tools' 'sip' 'python-sip')
depends=('gsl' 'glu' 'mesa' 'muparser' 'shared-mime-info'
         'desktop-file-utils' 'hicolor-icon-theme'
         'qwt5-qt5' 'qwtplot3d-qt5'
         'python-pyqt5')
conflicts=('scidavis')
source=("${_pkgname}-${pkgver}.zip::https://github.com/highperformancecoder/scidavis/archive/${_commit}.zip")
sha512sums=('c4ccd9ace46eeef5a184ea93bb48b338d6ae50cb06db33a95420370da3e5b9ff3b268e4f9da6d60c9b0c64dcc300cb46b4b9275736869cad039f74f4eee68211')

prepare() {
  cd "${_pkgname}-${_commit}"
}

build() {
  cd "${_pkgname}-${_commit}"
  qmake-qt5 \
	CONFIG+="liborigin python" \
	INCLUDEPATH+="/usr/include/qt/qwt5-qt5" \
	INCLUDEPATH+="/usr/include/qt/qwtplot3d-qt5" \
	LIBS+="-lqwt5-qt5 -lqwtplot3d-qt5" \
	QMAKE_CXXFLAGS=-fpermissive
  make qmake
  make
}

package() {
  cd "${_pkgname}-${_commit}"
  make INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install

  # remove liborigin files since it uses static library
  rm -rf "${pkgdir}/usr/local"

  # install translations (it looks like it does not provide target to do it)
  install -dm755 "${pkgdir}/usr/share/scidavis/translations/"
  find "scidavis/translations/" -name '*.qm' -type f -exec \
      install -Dm644 {} "${pkgdir}/usr/share/scidavis/translations/" \;
}
