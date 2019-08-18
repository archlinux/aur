# Maintainer: Lari Tikkanen <lartza@wippies.com>
# Contributor: arshlinux
pkgname=flood-git
pkgver=1.0.0.r385.g06089c4
pkgrel=1
pkgdesc='Flood: A web UI for rTorrent with a Node.js backend and React frontend. '
url='https://github.com/Flood-UI/flood'
license=('GPL3')
arch=('x86_64')
depends=('npm')
makedepends=('git' 'python2')
optdepends=('mediainfo')
backup=('etc/flood/config.js')
source=("$pkgname::git+https://github.com/Flood-UI/flood"
        'flood.service'
        'flood.sysusers'
        'flood.tmpfiles')
sha256sums=('SKIP'
            'b17bb76abaa4c3802bef845e3989cc810507a574eb970667690846bd8b5dd5dc'
            '351d9475fb25c43285f56b123d4415cd4a4bc5bebbc0c6cbe8be046031eb6900'
            '54bdb2682ad050e2ef43e209001eb2ad711ff4cbdd83fef860e3d94cf1edb514')

pkgver() {
    cd "$pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"

    cp config.template.js config.js
    sed -e "s|./server/db/|/var/lib/flood/db/|" -i config.js

    npm install --cache "${srcdir}/npm-cache --only=prod"
}

build() {
    cd "$pkgname"
    npm run build
}

package() {
    install -dm755 $pkgdir/usr/lib/flood
    cp -r $pkgname/* $pkgdir/usr/lib/flood

    install -dm750 $pkgdir/var/lib/flood/db

    install -dm755 $pkgdir/etc/flood
    mv $pkgdir/usr/lib/flood/config.js $pkgdir/etc/flood/config.js
    ln -s /etc/flood/config.js $pkgdir/usr/lib/flood/config.js

    install -Dm644 flood.service $pkgdir/usr/lib/systemd/system/flood.service
    install -Dm644 flood.sysusers $pkgdir/usr/lib/sysusers.d/flood.conf
    install -Dm644 flood.tmpfiles $pkgdir/usr/lib/tmpfiles.d/flood.conf

    # This doesn't save us much but oh well
    # Thanks Nicola (https://git.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/atom)
    find "${pkgdir}"/usr/lib/flood/node_modules \
        -name "*.a" -exec rm '{}' \; \
        -or -name "*.bat" -exec rm '{}' \; \
        -or -name "*.c" -exec rm '{}' \; \
        -or -name "*.cpp" -exec rm '{}' \; \
        -or -name "*.node" -exec chmod a-x '{}' \; \
        -or -name "benchmark" -prune -exec rm -r '{}' \; \
        -or -name "doc" -prune -exec rm -r '{}' \; \
        -or -name "html" -prune -exec rm -r '{}' \; \
        -or -name "man" -prune -exec rm -r '{}' \; \
        -or -name "scripts" -prune -exec rm -r '{}' \;
}
