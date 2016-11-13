# Maintainer: Lone_Wolf  <lonewolf at xs4all dot nl >
# Contributor: speps <speps dot archlinux dot org>

pkgname=qxmledit
pkgver=0.9.5
pkgrel=1
pkgdesc="Simple XML editor and XSD viewer"
arch=('x86_64')
url="http://qxmledit.org/"
license=('GPL3' 'LGPL3')
depends=('qt5-svg' 'qt5-xmlpatterns' 'glu')
makedepends=('freeglut')
source=("http://downloads.sourceforge.net/project/qxmledit/QXmlEdit-0.9.5/qxmledit-0.9.5-src.tgz")
sha256sums=('ac6341f1ceb004e64e070c6e99b5c3be3cfdf7d81a5556e79d99beb2f9eab43f')

prepare() {
  cd $pkgname-$pkgver

  # fix desktop file
#  sed -e '1i[Desktop Entry]' \
#      -e '/Encoding/d;/#/d' \
#      -i install_scripts/environment/desktop/QXmlEdit.desktop

    sed -i -e '/QMAKE_CXXFLAGS/s:-Werror::' \
                src/{QXmlEdit,QXmlEditWidget,sessions/QXmlEditSessions}.pro

}

build() {
  cd $pkgname-$pkgver
  export \
                QXMLEDIT_INST_DIR="/usr/bin" \
                QXMLEDIT_INST_LIB_DIR="/usr/lib" \
                QXMLEDIT_INST_INCLUDE_DIR="/usr/include/${pkgname}" \
                QXMLEDIT_INST_DATA_DIR="/usr/share/${pkgname}" \
                QXMLEDIT_INST_DOC_DIR="/usr/share/doc/${pkgname}"
  qmake-qt5
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir/" install

  # desktop
  install -Dm644 install_scripts/environment/desktop/QXmlEdit.desktop \
    "$pkgdir/usr/share/applications/QXmlEdit.desktop"

  # icon
  install -Dm644 install_scripts/environment/icon/qxmledit_48x48.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
