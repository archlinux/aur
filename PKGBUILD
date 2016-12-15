pkgname=flood-git
pkgver=r852.5e68d0a
pkgrel=3
pkgdesc='Flood: a modern web UI for rTorrent with a Node.js backend and React frontend.'
arch=(any)
depends=(npm)
makedepends=(git)
backup=(srv/flood/config.js)
source=('git+https://github.com/jfurrow/flood' flood.service)
md5sums=(SKIP SKIP)
install=flood.install

pkgver() {
    cd "$srcdir"/flood
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
    cd "$srcdir"/flood
    cp config.template.js config.js
}
package() {
    install -dm755 "$pkgdir"/srv
    cp -R "$srcdir"/flood "$pkgdir"/srv
    cd "$pkgdir"/srv/flood
    npm install --production
    chown -R 500:500 "$pkgdir"/srv/flood

    install -Dm644 "$srcdir"/flood.service "$pkgdir"/usr/lib/systemd/system/flood.service
}
