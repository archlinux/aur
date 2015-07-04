# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributer: Sam Burgos <jsbm1089 at gmail dot com>

pkgname=blueberry
pkgver=1.0.9
pkgrel=1
pkgdesc="Bluetooth configuration tool"
arch=('any')
url="https://github.com/linuxmint/blueberry"
license=('GPL')
depends=('gnome-bluetooth' 'python2-gobject' 'rfkill')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/linuxmint/blueberry/archive/$pkgver.tar.gz
        fix-monitoring-settings.patch
        detect-more-de.patch)
md5sums=('c5c84b09df2a8a4ffeff85d4eeb28fb7'
         '3824201f2b939bea0e522140c292d56e'
         '71977387ffb8bfa1415fa10353c821b6')

prepare() {
  cd $pkgname-$pkgver

  # Fix monitoring settings
  patch -Np1 -i ../fix-monitoring-settings.patch

  # Detect more DEs via XDG_CURRENT_DESKTOP
  patch -Np1 -i ../detect-more-de.patch

  # Hide in GNOME, KDE and Unity
  for i in etc/xdg/autostart/blueberry-tray.desktop usr/share/applications/blueberry.desktop
    do echo "NotShowIn=GNOME;KDE;Unity;" >> $i; done

  # Make blueberry-tray executable
  chmod +x usr/bin/blueberry-tray

  # Python2 fix
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' usr/bin/blueberry{,-tray}
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  cp -r etc usr "$pkgdir"
}
