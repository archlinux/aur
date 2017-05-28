# Maintainer: Tom Nguyen <tom81094@gmail.com>
# Contributor: Juraj Fiala <doctorjellyface at riseup dot net>

pkgbase=adwaita-qt
pkgname=(
  "${pkgbase}5"
  "${pkgbase}4"
)
pkgver=1.0
pkgrel=1
pkgdesc='A style to bend Qt applications to look like they belong into GNOME Shell'
arch=('i686' 'x86_64')
url="https://github.com/MartinBriza/$pkgbase"
license=('GPL')
groups=('adwaita-qt')
makedepends=('cmake' 'qt4' 'qt5-base')
optdepends=('qgnomeplatform: apply GNOME settings to Qt apps')
conflicts=('adwaita-qt-common')
replaces=('adwaita-qt-common')
source=("https://github.com/MartinBriza/$pkgbase/archive/$pkgver.tar.gz")
sha512sums=('35993a9f99f9d41812d448d679a9e7a8cb15e8ed9b23a2ea9a33c61c1bfc98a226f8bea2fce3ff0dab29420ff10c4e4a4a800c9b989475cc66c4042257fe154c')

prepare() {
  mkdir -p $pkgbase-$pkgver/build{-qt5,-qt4}
}

build() {
  cd $pkgbase-$pkgver

  pushd build-qt4
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT4=ON
  popd

  pushd build-qt5
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_ROOT=/usr/lib/qt
  popd

  make -C build-qt4
  make -C build-qt5
}

package_adwaita-qt4() {
  pkgdesc="${pkgdesc} (Qt4)"
  depends=('qt4')
  optdepends+=('adwaita-qt5: Qt5 version')

  cd $pkgbase-$pkgver
  make install/fast DESTDIR="$pkgdir" -C build-qt4
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}

package_adwaita-qt5() {
  pkgdesc="${pkgdesc} (Qt5)"
  depends=('qt5-base')
  optdepends+=('adwaita-qt4: Qt4 version')

  cd $pkgbase-$pkgver
  make install/fast DESTDIR="$pkgdir" -C build-qt5
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
