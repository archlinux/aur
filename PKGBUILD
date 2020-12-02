# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=fotowall
pkgver=1.0
pkgrel=3
pkgdesc="A creative tool that allows you to layout your photos or pictures in a personal way"
arch=('x86_64')
url="http://www.enricoros.com/opensource/fotowall/"
license=('LGPL3')
depends=('desktop-file-utils' 'qt5-svg')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/enricoros/fotowall/archive/v$pkgver.tar.gz"
	"fotowall-1.0-fix-build-against-qt-5.11.0.patch")
sha256sums=('8dc42262dd5220a12e92181ff82bd363a6506a4c3ab1ea3841281f2971e1b289'
	    'fa573efa3529939ca83d3dc96d49277fe4f5472978d7c8e119a147119ac4abb1')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../fotowall-1.0-fix-build-against-qt-5.11.0.patch
  sed -i 's|#include <QPainter>|#include <QPainter>\n#include <QPainterPath>|'  3rdparty/posterazor/paintcanvas.cpp
}

build() {
  cd $pkgname-$pkgver
  sed -i 's|Icon=fotowall|Icon=/usr/share/pixmaps/fotowall.png|' $pkgname.desktop
  qmake-qt5 PREFIX=/usr $pkgname.pro
  make
}

package() {
  make -C $pkgname-$pkgver INSTALL_ROOT="${pkgdir}/" install
}
