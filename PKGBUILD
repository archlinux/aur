# Maintainer: Dan Ziemba <zman0900@gmail.com>

pkgname=nut-monitor-git
pkgver=2.7.4.r3723.g92ecace7f
pkgrel=1
pkgdesc="GUI to manage devices connected a NUT server"
arch=('any')
url="http://www.networkupstools.org/"
license=('GPL3')
depends=('python2' 'pygtk')
provides=('nut-monitor')
conflicts=('nut-monitor')
makedepends=('desktop-file-utils' 'git')
source=('git+https://github.com/networkupstools/nut.git#branch=master')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/nut"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
  cd "$srcdir/nut"

  # Fake running autogen.sh - doesn't matter for building just nut-monitor
  touch scripts/augeas/nutupsconf.aug.in
  touch scripts/udev/nut-usbups.rules.in
  touch scripts/devd/nut-usb.conf.in
  touch scripts/systemd/nut-common.tmpfiles.in

  autoreconf -iv
  ./configure --with-python=python2 --without-python3
  
  sed -i 's|=NUT-Monitor|=nut-monitor|' scripts/python/app/nut-monitor.desktop
  sed -i 's|os.path.dirname( sys.argv\[0\] )|"/usr/share/nut-monitor"|' scripts/python/app/NUT-Monitor
}

package() {
  cd "$srcdir/nut"

  install -D -m644 scripts/python/module/PyNUT.py $pkgdir/usr/lib/python2.7/site-packages/PyNUT.py

  install -D -m 755 scripts/python/app/NUT-Monitor $pkgdir/usr/bin/nut-monitor
  install -D -m 644 scripts/python/app/icons/scalable/nut-monitor.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/nut-monitor.svg
  install -D -m 644 scripts/python/app/nut-monitor.appdata.xml $pkgdir/usr/share/appdata/nut-monitor.appdata.xml

  install -d -m 755 $pkgdir/usr/share/nut-monitor/pixmaps
  install -m 644 scripts/python/app/gui-1.3.glade $pkgdir/usr/share/nut-monitor/
  install -m 644 scripts/python/app/pixmaps/* $pkgdir/usr/share/nut-monitor/pixmaps/ 

  desktop-file-install --dir=$pkgdir/usr/share/applications scripts/python/app/nut-monitor.desktop
}
