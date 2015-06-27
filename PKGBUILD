# Maintainer: Dan Ziemba <zman0900@gmail.com>

pkgname=nut-monitor
pkgver=2.7.2
pkgrel=2
pkgdesc="GUI to manage devices connected a NUT server"
arch=('any')
url="http://www.networkupstools.org/"
# nut/scripts/python/README says GPL3, but appdata file in git says CCO-1.0
license=('GPL3')
depends=('network-ups-tools' 'python2')
makedepends=('desktop-file-utils')
source=("http://www.networkupstools.org/source/2.7/nut-$pkgver.tar.gz"
        'nut-monitor.appdata.xml')
sha256sums=('4d5365359b059d96dfcb77458f361a114d26c84f1297ffcd0c6c166f7200376d'
            'ed8915ca01d3df7cde418199679e5165d0a81996888689011dc4f80f6f56bec6')

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
  # Appdata file taken from git, should be in next release
  install -D -m 644 $srcdir/nut-monitor.appdata.xml $pkgdir/usr/share/appdata/nut-monitor.appdata.xml

  install -d -m 755 $pkgdir/usr/share/nut-monitor/pixmaps
  install -m 644 scripts/python/app/gui-1.3.glade $pkgdir/usr/share/nut-monitor/
  install -m 644 scripts/python/app/pixmaps/* $pkgdir/usr/share/nut-monitor/pixmaps/ 

  desktop-file-install --dir=$pkgdir/usr/share/applications scripts/python/app/nut-monitor.desktop
}
