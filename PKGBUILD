# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>

pkgbase=adwaita-qt
pkgname=("${pkgbase}5" "${pkgbase}4" "$pkgbase-common")
pkgver=0.4
pkgrel=1
pkgdesc='The stylesheet to bend Qt applications to look like they belong into GNOME Shell'
arch=('any' 'i686' 'x86_64')
url="https://github.com/MartinBriza/$pkgbase"
license=('GPL' 'LGPL')
groups=('adwaita-qt')
makedepends=('cmake' 'qt4' 'qt5-base')
source=("https://github.com/MartinBriza/$pkgbase/archive/$pkgver.tar.gz")
sha256sums=('48ccf17088afb77e98fe409f4dc6fdccd035bbdbcb51f0c2f0da00ef204daba0')

prepare() {
  mkdir -p build{-qt5,-qt4,-common}
}

build() {
  cd build-qt5
  cmake ../$pkgbase-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make

  cd ../build-qt4
  cmake ../$pkgbase-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT4=ON
  make
}

package_adwaita-qt5() {
  depends=('adwaita-qt-common' 'qt5-base')
  optdepends=('adwaita-qt4: Qt4 version')

  cd build-qt5
  make install/fast DESTDIR=$pkgdir
  mv $pkgdir/usr/lib/qt5 $pkgdir/usr/lib/qt
  # The assets are in common
  rm -rf $pkgdir/usr/share
}

package_adwaita-qt4() {
  depends=('adwaita-qt-common' 'qt4')

  cd build-qt4
  make install/fast DESTDIR=$pkgdir

  # The assets are in common
  rm -rf $pkgdir/usr/share
}

package_adwaita-qt-common() {
  arch=('any')

  install -Dm644 -t "$pkgdir/usr/share/themes/Adwaita/qt/assets/" "$srcdir/$pkgbase-$pkgver/assets/"*.png
}
