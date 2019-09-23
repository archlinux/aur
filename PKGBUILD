# Maintainer: Mirko Scholz
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Knut Franke <Knut.Franke ad gmx dot de>
# Contributor: Olaf Leidinger <leidola at newcon dot de>
# Contributor: Robal <nigrantis.tigris at gmail dot com>
# Contributor: Alexander <chronischzuspaet at gmail dot com> Kempen

# see https://svnweb.freebsd.org/ports/head/science/scidavis/Makefile?view=markup

_pkgname=scidavis
pkgname=scidavis-qt5
pkgver=1.25.1
_commit=0f3383dc57bc9b756a65d90e88da91952eeb6173
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
source=("${_pkgname}-${pkgver}.zip::https://github.com/highperformancecoder/scidavis/archive/${_commit}.zip"
"future_absolute.patch"
)
sha512sums=('4c0c27e9edbbc95c1c9949e20d5efd9108805240b1cad2b590a9d88b56a269b2cb83c9473d3f15e83cfe9cd871452f31d3268efa6dd4d16c90560d29f7bca3e2'
            'acf508143b95b4b1a8bfba4036fe9fe8845bdc0a4ab2c3e436e41a1031dc24c9244614b6177c8dd41c8fcbce9ac461f1fccf8b43e18f79afe49a835408a2d1fc')

prepare() {
  cd "${_pkgname}-${_commit}"
  patch --forward --strip=1 --input="${srcdir}/future_absolute.patch"
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
