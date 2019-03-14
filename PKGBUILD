# Maintainer: Dan Ziemba <zman0900@gmail.com>

pkgname=nut-monitor
pkgver=2.7.4
pkgrel=2
pkgdesc="GUI to manage devices connected a NUT server"
arch=('any')
url="http://www.networkupstools.org/"
license=('GPL3')
depends=('network-ups-tools' 'python2' 'pygtk')
makedepends=('desktop-file-utils')
source=("http://www.networkupstools.org/source/2.7/nut-$pkgver.tar.gz")
sha256sums=('980e82918c52d364605c0703a5dcf01f74ad2ef06e3d365949e43b7d406d25a7')

prepare() {
  cd "$srcdir/nut-$pkgver"
  
  sed -i 's|=NUT-Monitor|=nut-monitor|'  scripts/python/app/nut-monitor.desktop
  sed -i 's|=nut-monitor.png|=nut-monitor|' scripts/python/app/nut-monitor.desktop
  sed -i 's|os.path.dirname( sys.argv\[0\] )|"/usr/share/nut-monitor"|' scripts/python/app/NUT-Monitor
  sed -i 's|/usr/bin/env python|/usr/bin/env python2.7|' scripts/python/app/NUT-Monitor
}

package() {
  cd "$srcdir/nut-$pkgver"

  install -D -m644 scripts/python/module/PyNUT.py $pkgdir/usr/lib/python2.7/site-packages/PyNUT.py

  install -D -m 755 scripts/python/app/NUT-Monitor $pkgdir/usr/bin/nut-monitor
  install -D -m 644 scripts/python/app/nut-monitor.png $pkgdir/usr/share/pixmaps/nut-monitor.png
  install -D -m 644 scripts/python/app/nut-monitor.appdata.xml $pkgdir/usr/share/appdata/nut-monitor.appdata.xml

  install -d -m 755 $pkgdir/usr/share/nut-monitor/pixmaps
  install -m 644 scripts/python/app/gui-1.3.glade $pkgdir/usr/share/nut-monitor/
  install -m 644 scripts/python/app/pixmaps/* $pkgdir/usr/share/nut-monitor/pixmaps/ 

  desktop-file-install --dir=$pkgdir/usr/share/applications scripts/python/app/nut-monitor.desktop
}
