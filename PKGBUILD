pkgname=qwt-qt6
pkgver=6.3.0
pkgrel=1
pkgdesc="Qt Widgets for Technical Applications (qt6)"
arch=('any')
license=('custom:qwt')
url="https://qwt.sourceforge.io/"
depends=('qt6-svg')
makedepends=('qt6-base')
source=("http://downloads.sourceforge.net/qwt/qwt-${pkgver}.tar.bz2")
sha256sums=('dcb085896c28aaec5518cbc08c0ee2b4e60ada7ac929d82639f6189851a6129a')

prepare() {
  cd qwt-${pkgver}
  sed -e '/^\s*QWT_INSTALL_PREFIX/ s|=.*|= /usr|' \
      -e '/^QWT_INSTALL_DOCS/ s|/doc|/share/doc/qwt-qt6|' \
      -e '/^QWT_INSTALL_HEADERS/ s|include|&/qwt-qt6|' \
      -e '/^QWT_INSTALL_PLUGINS/ s|plugins/designer|lib/qt6/&|' \
      -e '/^QWT_INSTALL_FEATURES/ s|features|lib/qt6/mkspecs/&|' \
      -i qwtconfig.pri
  sed -e '/^TARGET/ s|(qwt)|(qwt-qt$${QT_MAJOR_VERSION})|' \
      -e '/^\s*QWT_SONAME/ s|libqwt|&-qt$${QT_MAJOR_VERSION}|' \
      -i src/src.pro
  sed -e "/QwtExamples/d" -e "/QwtTests/d" -e "/QwtPlayground/d" -i qwtconfig.pri
}

build() {
  cd qwt-${pkgver}
  qmake6 qwt.pro
  make 
}

package() {
  cd qwt-${pkgver}
  make install INSTALL_ROOT="${pkgdir}" 
}
