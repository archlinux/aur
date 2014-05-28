# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=easyrpg-editor-qt-git
pkgver=r279.85dcf89
pkgrel=1
pkgdesc="EasyRPG's Game Editor (QT, development version)"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('unknown')
conflicts=('easyrpg-editor-qt')
provides=('easyrpg-editor-qt')
makedepends=('git')
depends=('liblcf-git' 'qt5-multimedia')
install="$pkgname.install"
source=(easyrpg-editor-qt::"git+https://github.com/EasyRPG/editor-qt.git")
md5sums=('SKIP')

pkgver() {
  cd easyrpg-editor-qt
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd easyrpg-editor-qt
  # set include folder for liblcf and reorder libraries
  sed -e 's|$$PWD/libs/liblcf/src|/usr/include/liblcf|;/liblcf\/generated/d' \
    -e 's|-lexpat -llcf|-llcf -lexpat|' -i EasyRPG-Editor.pro
  # build fixes for file names (Mariano does not know the difference between
  # lowercase and uppercase or develops under dos)
  sed 's|QGraphicsCharaItem.h|qgraphicscharaitem.h|' \
    -i src/{{dialogcharapicker,tools/qeventpagewidget}.h,tools/QGraphicsCharaItem.cpp}
  sed 's|QGraphicsFaceItem.h|qgraphicsfaceitem.h|' -i src/dialogfacepicker.h
  sed 's|QGraphicsMapScene.h|qgraphicsmapscene.h|' -i src/{mainwindow.h,core.cpp}
  sed 's|DialogEvent.h|dialogEvent.h|' -i src/{dialogEvent,tools/qgraphicsmapscene}.cpp
  sed 's|ui_qeventpagewidget.h|ui_qeventpageWidget.h|' -i src/tools/qeventpagewidget.cpp
  sed 's|qgraphicspaletescene.h|QGraphicsPaleteScene.h|' -i src/tools/qgraphicspaletescene.cpp
  sed 's|ui_QDbPageClasses.h|ui_qdbpageclasses.h|' -i src/tools/qdbpageclasses.cpp
}

build () {
  cd easyrpg-editor-qt

  qmake-qt5
  make
}

package () {
  cd easyrpg-editor-qt/bin

  # binary
  install -Dm755 EasyRPG-Editor "$pkgdir"/usr/bin/easyrpg-editor-qt
  # templates
  install -d "$pkgdir"/usr/share/easyrpg-editor-qt/templates
  install -m644 templates/* "$pkgdir"/usr/share/easyrpg-editor-qt/templates
}
