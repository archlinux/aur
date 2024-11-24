# Maintainer: gao <gao66 at sdf dot org>

pkgname=cronicle-git
_pkgname=Cronicle
pkgver=0.9.61.r1.g48490e0
pkgrel=2
pkgdesc="A simple, distributed task scheduler and runner"
arch=('any')
url="https://github.com/jhuckaby/Cronicle"
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
install="$pkgname.install"
source=("git+$url.git"
        "cronicle.service")
sha256sums=('SKIP'
            '404526261b497e2f62523274d1941c6438fcb9bce63f12cb6dabf774cf470882')
backup=('opt/cronicle/conf/config.json'
        'usr/lib/systemd/system/cronicle.service')

conflicts=('cronicle')
provides=('cronicle')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    npm install
    node bin/build.js dist
}

package() {
    cd "$srcdir/$_pkgname"
    install -d "$pkgdir/opt/cronicle"
    cp -a ./* "$pkgdir/opt/cronicle/"

    install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}/LICENSE" LICENSE.md

    rm -rf "$pkgdir/opt/cronicle/.git"
    install -Dm644 "$srcdir/cronicle.service" "$pkgdir/usr/lib/systemd/system/cronicle.service"
}

