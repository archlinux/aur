pkgname=flood-git
pkgver=r1291.1493f8f
pkgrel=1
pkgdesc='Flood: a modern web UI for rTorrent with a Node.js backend and React frontend.'
url='https://github.com/jfurrow/flood'
arch=(any)
depends=(npm)
makedepends=(git)
optdepends=(mediainfo)
backup=(var/lib/flood/config.js)
options=(!strip)
source=(
    'git+https://github.com/jfurrow/flood'
    flood.service
    flood.sysusers
    flood.tmpfiles
    install.sh
    )
md5sums=(SKIP SKIP SKIP SKIP SKIP)

pkgver() {
    cd flood
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd flood
    cp config.template.js config.js
}

package() {
    install -dm755 $pkgdir/var/lib
    cp -r flood $pkgdir/var/lib
    chmod 750 $pkgdir/var/lib/flood

    install -Dm644 flood/config.template.js $pkgdir/etc/default/flood.js

    cd $srcdir
    install -Dm644 flood.service $pkgdir/usr/lib/systemd/system/flood.service
    install -Dm644 flood.sysusers $pkgdir/usr/lib/sysusers.d/flood.conf
    install -Dm644 flood.tmpfiles $pkgdir/usr/lib/tmpfiles.d/flood.conf

    install -Dm755 install.sh $pkgdir/usr/bin/flood_install
}
