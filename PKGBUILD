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
  
  patch --forward -p1 -i ${srcdir}/../001-qwtconfig-arch.patch
  sed -e '/^TARGET/ s|(qwt)|(qwt-qt$${QT_MAJOR_VERSION})|' \
      -e '/^\s*QWT_SONAME/ s|libqwt|&-qt$${QT_MAJOR_VERSION}|' \
      -i src/src.pro
}

build() {
  cd qwt-6.2
  qmake6 qwt.pro
  make
}

package() {
  cd qwt-6.2
  make INSTALL_ROOT="${pkgdir}" install

  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
