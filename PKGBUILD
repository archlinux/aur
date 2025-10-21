# Maintainer: Jaroslav Bolek www.jbolek.cz <jaroslav.bolek@gmail.com>
pkgname=lenovo-legion16irx9h
pkgver=1.0.0
pkgrel=3
pkgdesc="Lenovo Legion Pro 7 16IRX9H driver"
arch=("x86_64")
url="https://github.com/bolekjar/LenovoLegion/archive/refs/tags/release/${pkgver}.tar.gz"
license=('GPL3')
depends=("qt6-base" "qt6-5compat" "dkms" "make" "gcc" "qt6-charts")
source=("LenovoLegion-release-$pkgver.tar.gz::$url")
sha256sums=('e1f491c85da0029188285f1ee63e7f4e062f977c728cbdcafb770d629621374d')
install=default.install

package() {
  #prepare directories
  mkdir -p $pkgdir/opt/LenovoLegion-$pkgver
  mkdir -p $pkgdir/usr/src/LenovoLegion-$pkgver
  mkdir -p $pkgdir/usr/lib/systemd/system/
  mkdir -p $pkgdir/etc/modprobe.d/
  mkdir -p $pkgdir/etc/modules-load.d/
  mkdir -p $pkgdir/usr/share/applications/


  ln -s LenovoLegion-$pkgver $pkgdir/opt/LenovoLegion

  #dms driver
  cp $srcdir/LenovoLegion-release-$pkgver/LenovoLegion-dkms/* $pkgdir/usr/src/LenovoLegion-$pkgver

  #settings
  cp $srcdir/LenovoLegion-release-$pkgver/LenovoLegion-dkms/blacklist-lenovo-legion.conf $pkgdir/etc/modprobe.d/
  cp $srcdir/LenovoLegion-release-$pkgver/LenovoLegion-dkms/lenovo-legion.conf $pkgdir/etc/modules-load.d/

  #daemon, gui
  qmake6 $srcdir/LenovoLegion-release-$pkgver/LenovoLegion/ -o $srcdir/LenovoLegion-release-$pkgver/LenovoLegion/Makefile
  make -C $srcdir/LenovoLegion-release-$pkgver/LenovoLegion/

  #daemon, gui
  cp -r $srcdir/LenovoLegion-release-$pkgver/LenovoLegion/Installation/* $pkgdir/opt/LenovoLegion-$pkgver
  chmod 777 $pkgdir/opt/LenovoLegion-$pkgver/log
  chmod 777 $pkgdir/opt/LenovoLegion-$pkgver/data

  #daemon setings
  cp $srcdir/LenovoLegion-release-$pkgver/LenovoLegion/LenovoLegion-Daemon/lenovo-legion-daemon.service $pkgdir/usr/lib/systemd/system/

  #kde menu entry
  cp $srcdir/LenovoLegion-release-$pkgver/LenovoLegion/LenovoLegion-Application/LenovoLegion.desktop $pkgdir/usr/share/applications/
}
