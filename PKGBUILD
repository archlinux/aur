# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>

pkgbase=adwaita-qt
pkgname=(
  "${pkgbase}5"
  "${pkgbase}4"
  "$pkgbase-common"
)
pkgver=0.4
pkgrel=2
pkgdesc='A style to bend Qt applications to look like they belong into GNOME Shell.'
arch=('any' 'i686' 'x86_64')
url="https://github.com/MartinBriza/$pkgbase"
license=('GPL' 'LGPL')
groups=('adwaita-qt')
makedepends=(
  'cmake'
  'qt4'
  'qt5-base'
)
source=("https://github.com/MartinBriza/$pkgbase/archive/$pkgver.tar.gz")
sha256sums=('48ccf17088afb77e98fe409f4dc6fdccd035bbdbcb51f0c2f0da00ef204daba0')

prepare() {
  mkdir -p $pkgbase-$pkgver/build{-qt,-qt4}
}

build() {
  cd $pkgbase-$pkgver

  pushd build-qt4
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT4=ON
  popd

  pushd build-qt
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_ROOT=/usr/lib/qt
  popd

  make -C build-qt4
  make -C build-qt
}

package_adwaita-qt4() {
  arch=('i686' 'x86_64')
  depends=('adwaita-qt-common' 'qt4')

  cd $pkgbase-$pkgver
  make install/fast DESTDIR=$pkgdir -C build-qt4
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md

  # The assets are in common
  rm -rf $pkgdir/usr/share
}

package_adwaita-qt5() {
  arch=('i686' 'x86_64')
  depends=('adwaita-qt-common' 'qt5-base')
  optdepends=('adwaita-qt4: Qt4 version')

  cd $pkgbase-$pkgver
  make install/fast DESTDIR=$pkgdir -C build-qt
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md

  # The assets are in common
  rm -rf $pkgdir/usr/share
}

package_adwaita-qt-common() {
  arch=('any')
  license=('GPL')

  install -Dm644 -t "$pkgdir/usr/share/themes/Adwaita/qt/assets/" "$pkgbase-$pkgver/assets/"*.png
}
