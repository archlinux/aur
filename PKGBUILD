# Maintainer: Jack Allnutt <jack@allnutt.eu>
pkgname=kiwiirc
pkgver=0.9.1
pkgrel=2
pkgdesc="A hand-crafted web-based IRC client that you can enjoy"
arch=('any')
url="https://kiwiirc.com/"
license=('AGPL3')
depends=('nodejs>=0.10.0', 'npm')
makedepends=('git')
options=('emptydirs' '!strip')
install=('kiwiirc.install')
backup=('etc/kiwiirc/config.js')
source=(https://github.com/prawnsalad/KiwiIRC/archive/v$pkgver.tar.gz
    'kiwi.patch'
    'kiwiirc.service'
    'kiwiirc.conf.sysusers'
    'kiwiirc.conf.tmpfiles')
md5sums=('06c18949f5254262379bc2ba5b29b10a'
         '3c417d55e5cdbc27fadf8d8b9af1ed76'
         'bcb28ddb7f0bcc3be830b8045969eb2c'
         '593da856bcf9036bc51380b74d9df394'
         '803080337de27be8921edd76f15c763c')

build() {
    cp kiwiirc.service "$srcdir/KiwiIRC-$pkgver/"
    cp kiwiirc.conf.sysusers "$srcdir/KiwiIRC-$pkgver/"
    cp kiwiirc.conf.tmpfiles "$srcdir/KiwiIRC-$pkgver/"
    cd "$srcdir/KiwiIRC-$pkgver"
    git apply --whitespace=fix ../kiwi.patch
    npm -q install
    npm -q dedupe
}

package() {
    cd "$srcdir"
    install -D -m644 KiwiIRC-$pkgver/config.example.js $pkgdir/etc/kiwiirc/config.js
    install -D -m755 KiwiIRC-$pkgver/kiwi $pkgdir/usr/bin/kiwi
    install -D -m644 KiwiIRC-$pkgver/kiwiirc.service $pkgdir/usr/lib/systemd/system/kiwiirc.service
    install -D -m644 KiwiIRC-$pkgver/man/kiwiirc.1 $pkgdir/usr/share/man/man1/kiwi.1
    install -D -m644 KiwiIRC-$pkgver/package.json $pkgdir/usr/share/kiwiirc/package.json
    install -D -m644 KiwiIRC-$pkgver/README.md $pkgdir/usr/share/kiwiirc/README.md
    install -D -m644 KiwiIRC-$pkgver/kiwiirc.conf.sysusers $pkgdir/usr/lib/sysusers.d/kiwiirc.conf
    install -D -m644 KiwiIRC-$pkgver/kiwiirc.conf.tmpfiles $pkgdir/usr/lib/tmpfiles.d/kiwiirc.conf

    install -d -m755 $pkgdir/usr/lib/kiwiirc/server_modules
    install -d -m755 $pkgdir/var/lib/kiwiirc
    install -d -m644 $pkgdir/var/log/kiwiirc
    install -d -m755 $pkgdir/usr/share/kiwiirc/server
    install -d -m755 $pkgdir/usr/share/kiwiirc/node_modules

    cp -dr --preserve=mode KiwiIRC-$pkgver/client/* $pkgdir/var/lib/kiwiirc
    cp -dr --preserve=mode KiwiIRC-$pkgver/node_modules $pkgdir/usr/share/kiwiirc/
    cp -dr --preserve=mode KiwiIRC-$pkgver/server $pkgdir/usr/share/kiwiirc
    cp -dr --preserve=mode KiwiIRC-$pkgver/server_modules $pkgdir/usr/lib/kiwiirc
}
