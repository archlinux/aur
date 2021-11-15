pkgname=qwt61-multiaxes-svn
pkgver=6.1.r3381
_qwt_ver="6.1"
pkgrel=1
pkgdesc='Qt Widgets for Technical Applications -- mutiaxes branch'
url='https://qwt.sourceforge.io/'
arch=('x86_64')
depends=('qt5-base' 'qt5-svg')
optdepends=('qt5-tools: For Designer plugin')
makedepends=('qt5-tools' 'subversion')
conflicts=(qwt)
provides=(qwt)
license=("custom:qwt")
source=("svn+https://svn.code.sf.net/p/qwt/code/branches/qwt-6.1-multiaxes")
sha512sums=('SKIP')

pkgver(){
  cd qwt-6.1-multiaxes
  local ver="$(svnversion)"
  printf "${_qwt_ver}.r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd qwt-6.1-multiaxes
  
  sed -e '/^\s*QWT_INSTALL_PREFIX/ s|=.*|= /usr|' \
      -e '/^QWT_INSTALL_DOCS/ s|/doc|/share/doc/qwt|' \
      -e '/^QWT_INSTALL_HEADERS/ s|include|&/qwt|' \
      -e '/^QWT_INSTALL_PLUGINS/ s|plugins/designer|lib/qt/&|' \
      -e '/^QWT_INSTALL_FEATURES/ s|features|lib/qt/mkspecs/&|' \
      -i qwtconfig.pri
}

build() {
  cd qwt-6.1-multiaxes
  qmake-qt5 qwt.pro
  make
}

package() {
  cd qwt-6.1-multiaxes
  make INSTALL_ROOT="${pkgdir}" install

  #mv "${pkgdir}/usr/share/doc/qwt/man" "${pkgdir}/usr/share"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
