# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=gcompris-qt
pkgver=0.70
pkgrel=2
pkgdesc="Educational software suite comprising of numerous activities for children aged 2 to 10"
arch=('i686' 'x86_64')
url="http://gcompris.net/"
license=('GPL3')
depends=('qt5-declarative' 'qt5-multimedia' 'qt5-svg' 'qt5-tools' 'qt5-sensors'
         'qt5-quickcontrols' 'qt5-graphicaleffects' 'qml-box2d')
makedepends=('cmake' 'git' 'qt5-tools')
replaces=('gcompris' 'gcompris-data')
source=(http://gcompris.net/download/qt/src/$pkgname-$pkgver.tar.xz
        0001-chess-Qt-bug-in-5.8-with-do-while-loop-https-bugrepo.patch
        0002-chess-Qt-bug-in-5.8-with-do-while-loop-https-bugrepo.patch
        0003-chess-allow-to-move-again-the-same-piece-after-undo.patch)
sha256sums=('8a475ac354dad320dee1c1f6835fb1bb36ef91fe157870bda3562c5e1b8a2707'
            'd9788a7c9df61be76a1ac47186fbfe565b4c66d7cbae769e11dba3401b28a05d'
            'bdf09a6b11204d9e2c97e56b1bff64b0faa65f2ce46c840a35262c5e7b86acee'
            'b5cb2dfe1f6103488afdf1196216b27b503a9b4724212c502dad75ea2f46f8a8')

prepare() {
  cd $pkgname-$pkgver
  mkdir build

  # Fix bugs in the chess activity
  patch -Np1 -i ../0001-chess-Qt-bug-in-5.8-with-do-while-loop-https-bugrepo.patch
  patch -Np1 -i ../0002-chess-Qt-bug-in-5.8-with-do-while-loop-https-bugrepo.patch
  patch -Np1 -i ../0003-chess-allow-to-move-again-the-same-piece-after-undo.patch
}

build() {
  cd $pkgname-$pkgver/build

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQML_BOX2D_LIBRARY=/usr/lib/qt/qml/Box2D.2.0 \
    ..
  make
}

package() {
  cd $pkgname-$pkgver
  make -C build DESTDIR="$pkgdir" install
  install -Dm644 org.kde.gcompris.desktop "$pkgdir/usr/share/applications/gcompris.desktop"
  install -Dm644 GCompris80.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
