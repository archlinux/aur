# Maintainer: Mirko Scholz
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Knut Franke <Knut.Franke ad gmx dot de>
# Contributor: Olaf Leidinger <leidola at newcon dot de>
# Contributor: Robal <nigrantis.tigris at gmail dot com>
# Contributor: Alexander <chronischzuspaet at gmail dot com> Kempen

# see https://svnweb.freebsd.org/ports/head/science/scidavis/Makefile?view=markup

_pkgname=scidavis
pkgname=scidavis-qt5
pkgver=2.4.0
_commit=${pkgver}
_commit_liborigin=4788f5bf674f93dab26c01bed84813e53f259c86
_commit_qwtplot3d=fce8eb0034827f0e0f86a36c075ef648343ac7cf
pkgrel=1
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of QtiPlot. Qt5 port"
arch=('x86_64')
url="http://scidavis.sourceforge.net/"
license=('GPL')
makedepends=('boost' 'cmake' 'qt5-tools'
'sip4' 'python-sip4'
'qwt5-qt5>=5.2.3.1-2'
)
depends=('gsl' 'glu' 'mesa' 'muparser>=2.3.2' 'shared-mime-info'
'desktop-file-utils' 'hicolor-icon-theme'
'python-pyqt5'
'python-pyqt5-sip'
'qt5-svg'
'python' 'python-scipy')
conflicts=('scidavis')
source=(
   "${_pkgname}-${pkgver}.zip::https://github.com/highperformancecoder/scidavis/archive/${_commit}.zip"
   "liborigin-${_commit_liborigin}.zip::https://github.com/SciDAVis/liborigin/archive/${_commit_liborigin}.zip"
   "qwtplot3d-${_commit_qwtplot3d}.zip::https://github.com/SciDAVis/qwtplot3d/archive/${_commit_qwtplot3d}.zip"
)
sha512sums=('a77733b397ed3d26f872f6dac4d6bf73df55499da797266337a1f894be2b72d6a6568ed38308ee04b02e0c18fcdfc68b9b1aebe808fb2878b6492615047ec242'
            'aab71ea6100df3c81194e7304a07cf51f2c1fbb4d8f6292a2aff003d704fe14fc9ab8fd63d46b8403adf4f818297c2db852acf8e6431166d2055cda928e2a9eb'
            '83462b94c8063e7dbd9251a181ff4dc7862dd274268fcd7ea79e7888befdd820b159486c3e884fa172ffd12a31b537bb13fe605d14ea019d8977368baaf89850')

prepare() {
  cd "${_pkgname}-${_commit}"
  rm -rf 3rdparty/liborigin
  mv ../liborigin-${_commit_liborigin} 3rdparty/liborigin
  rm -rf 3rdparty/qwtplot3d 
  mv ../qwtplot3d-${_commit_qwtplot3d} 3rdparty/qwtplot3d
  mkdir -p build
}

build() {
  cd "${_pkgname}-${_commit}"
  cd build
  cmake ..  -DSEARCH_FOR_UPDATES=OFF -DDOWNLOAD_LINKS=OFF -DORIGIN_IMPORT=ON -DSCRIPTING_PYTHON=ON \
            -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${_pkgname}-${_commit}"
  cd build
  make INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install
}
