# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>

pkgbase=adwaita-qt
pkgname=('adwaita-qt5' 'adwaita-qt4' 'adwaita-qt-common')
pkgver=0.3.1
pkgrel=2
pkgdesc='The stylesheet to bend Qt applications to look like they belong into GNOME Shell'
arch=('i686' 'x86_64')
url='https://github.com/MartinBriza/adwaita-qt'
license=('GPL' 'LGPL')
makedepends=('gcc-libs-multilib' 'qt4' 'qt5-base')
source=("https://github.com/MartinBriza/adwaita-qt/archive/master.zip")
md5sums=('9f44301af62f90db589e4c75e21d77c9')

prepare() {
  mkdir build{-qt5,-qt4,-common}
  mkdir build-common/usr
}

build() {
  cd build-qt5
  cmake ../${pkgbase}-master \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF
  make

  cd ../build-qt4
  cmake ../${pkgbase}-master \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT4=ON \
    -DBUILD_TESTING=OFF
  make
}

package_adwaita-qt5() {
  depends=('adwaita-qt-common' 'gcc-libs-multilib' 'qt5-base')
  optdepends=('adwaita-qt4: Qt4 version')

  cd build-qt5
  make install/fast DESTDIR=$pkgdir
  mv $pkgdir/usr/lib/qt5 $pkgdir/usr/lib/qt
  mv $pkgdir/usr/share $srcdir/build-common/usr
}

package_adwaita-qt4() {
  depends=('adwaita-qt-common' 'gcc-libs-multilib' 'qt4')

  cd build-qt4
  make install/fast DESTDIR=$pkgdir
  
  rm -rf $pkgdir/usr/share
}

package_adwaita-qt-common() {
  arch=('any')
  
  mv build-common/usr $pkgdir
}
