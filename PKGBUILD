# Maintainer: Mirko Scholz
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Knut Franke <Knut.Franke ad gmx dot de>
# Contributor: Olaf Leidinger <leidola at newcon dot de>
# Contributor: Robal <nigrantis.tigris at gmail dot com>
# Contributor: Alexander <chronischzuspaet at gmail dot com> Kempen

# see https://svnweb.freebsd.org/ports/head/science/scidavis/Makefile?view=markup

_pkgname=scidavis
pkgname=scidavis-qt5
pkgver=2.1.4
_commit=2.1.4
pkgrel=1
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of QtiPlot. Qt5 port"
arch=('x86_64')
url="http://scidavis.sourceforge.net/"
license=('GPL')
makedepends=('boost' 'cmake' 'qt5-tools'
'qwt5-qt5>=5.2.3.1-2'
'qwtplot3d-qt5>=0.2.7-3'
)
depends=('gsl' 'glu' 'mesa' 'muparser' 'shared-mime-info'
'desktop-file-utils' 'hicolor-icon-theme'
'sip' 'python-sip' 'python-pyqt5'
'python' 'python-scipy')
conflicts=('scidavis')
source=("${_pkgname}-${pkgver}.zip::https://github.com/highperformancecoder/scidavis/archive/${_commit}.zip"
'patch-linking'
)
sha512sums=('026c8bef87573e5ea42feab62efcaefd3deeb1d74dc86cdbdec17fd28e97914e785fb70f84addc582f3326d4d3bbe25fa399e85918b720019815f7bf84e0cc51'
            '69f04800343935141ad224510a915a8cbdbd0e07401a61530a52e18ea5d02b85f7e579f70b6bb32b37e085c07f61a8ce3f9c83f7b7b9cfe0553624b8ff9ff5db')

prepare() {
  cd "${_pkgname}-${_commit}"
  patch --forward --strip=1 --input="${srcdir}/patch-linking"
}

build() {
  cd "${_pkgname}-${_commit}"
  qmake-qt5 \
	CONFIG+="liborigin python" \
	INCLUDEPATH+="/usr/include/qt/qwt5-qt5" \
	INCLUDEPATH+="/usr/include/qt/qwtplot3d-qt5" \
	LIBS+="-lqwt5-qt5 -lqwtplot3d-qt5" \
	QMAKE_CXXFLAGS="-Wno-deprecated-copy -Wno-deprecated-declarations -fpermissive"
  make qmake
  make
}

package() {
  cd "${_pkgname}-${_commit}"
  make INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install

  python -m py_compile "${pkgdir}/etc/scidavisrc.py"
  mv ${pkgdir}/etc/__pycache__/scidavisrc*.pyc "${pkgdir}/etc/scidavisrc.pyc"
  rm -rf ${pkgdir}/etc/__pycache__

  # remove liborigin files since it uses static library
  rm -rf "${pkgdir}/usr/local"

  # install translations (it looks like it does not provide target to do it)
  install -dm755 "${pkgdir}/usr/share/scidavis/translations/"
  find "scidavis/translations/" -name '*.qm' -type f -exec \
      install -Dm644 {} "${pkgdir}/usr/share/scidavis/translations/" \;
}
