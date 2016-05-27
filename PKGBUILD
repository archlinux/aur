# Maintainer: rafaelff <rafaelff@gnome.org>

pkgname=twp
pkgver=0.3.0
pkgrel=2
pkgdesc="Teeworlds Web Panel for management of local Teeworlds servers"
arch=(any)
url="https://www.teeworlds.com/forum/viewtopic.php?id=11626"
#url="http://cytral.github.io/twp"
license=('AGPL')
depends=(sqlite3 python2-flask-babel python2-flask-apscheduler python2-pillow
         python2-sqlalchemy python2-mergedict python2-singledispatch
         python2-flask-sqlalchemy python2-dateutil python2-flask-wtf
         python2-webassets python2-flask-assets python2-jsmin)
makedepends=(unzip)
install=twp.install
backup=(srv/twp/twp.conf)
source=("$pkgname-$pkgver.zip::https://github.com/CytraL/$pkgname/archive/$pkgver.zip"
        "twp.service")
md5sums=('SKIP'
         '50b2b3808bea9a33081de2596b67f689')

check() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 test.py
}

package() {
	   # install systemd service file
    install -Dm644 "twp.service" "$pkgdir/usr/lib/systemd/system/twp.service"
    
       # enter and install files in the pkgdir
    install -dm2755 "$pkgdir/srv/twp/"
    cd "$pkgdir/srv/twp/"
    cp -a "$srcdir/$pkgname-$pkgver"/* .
    
       # fix python2 calling
    sed -i 's:env python:&2:' run.py
    sed -i 's:#!/usr/bin/python:&2:' tools/netstat.py
}
