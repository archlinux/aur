pkgname=qwt-qt6-svn
pkgver=6.2.0
pkgrel=1
pkgdesc='Qt Widgets for Technical Applications'
url='https://qwt.sourceforge.io/'
arch=('x86_64')
depends=('qt6-base' 'qt6-svg')
optdepends=('qt6-tools: For Designer plugin')
makedepends=('qt6-tools' 'subversion')
license=("custom:qwt")
source=("svn+https://svn.code.sf.net/p/qwt/code/branches/qwt-6.2")
sha512sums=('SKIP')

prepare() {
  cd qwt-6.2
  
  sed -e '/^\s*QWT_INSTALL_PREFIX/ s|=.*|= /usr|' \
      -e '/^QWT_INSTALL_DOCS/ s|/doc|/share/doc/qwt|' \
      -e '/^QWT_INSTALL_HEADERS/ s|include|&/qwt|' \
      -e '/^QWT_INSTALL_PLUGINS/ s|plugins/designer|lib/qt/&|' \
      -e '/^QWT_INSTALL_FEATURES/ s|features|lib/qt/mkspecs/&|' \
      -i qwtconfig.pri
}

build() {
  cd qwt-6.2
  qmake-qt6 qwt.pro
  make
}

package() {
  cd qwt-6.2
  make INSTALL_ROOT="${pkgdir}" install

  mv "${pkgdir}/usr/share/doc/qwt/man" "${pkgdir}/usr/share"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
