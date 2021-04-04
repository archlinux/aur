# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Giovanni Harting <539@idlegandalf.com>

pkgname=cryptpad
pkgver=4.3.0
pkgrel=2
pkgdesc="Realtime collaborative visual editor with zero knowlege server"
arch=('any')
url="https://github.com/xwiki-labs/cryptpad"
license=(AGPL3)
depends=(nodejs)
makedepends=(bower npm git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/xwiki-labs/cryptpad/archive/$pkgver.tar.gz"
        "cryptpad.service"
        "cryptpad.sysusers"
        "cryptpad.tmpfiles")
sha256sums=('aefa5853981b11853aad60439071fa9e3b5e5fd0642cb48adf7cd1e8133dc8f5'
            '522851fbe4e0e41fd6ece8b2b0ed17bbae0233a58328b7994a5207aa341a635b'
            '999a271d64b75c7c447fdb21486b27463c04679677e57ea9551a3b0429c618f6'
            '8e5a200747cb77142cf6d08d3490fefc0d3142f196da13c84d3e530b30f6f72b')

package() {
    cd "$pkgname-$pkgver"
    export NODE_ENV=production
    npm install --user root --prefix "$pkgdir/usr/share/$pkgname" --cache "$srcdir"/npm-cache
    bower install --allow-root

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i '/_where/d'

    # Documentation
    install -t "$pkgdir/usr/share/doc/$pkgname" -Dm 644 docs/{ARCHITECTURE.md,example.nginx.conf} CHANGELOG.md

    # Cryptpad
    install -Dt "$pkgdir/usr/share/$pkgname" package.json server.js
    cp -rt "$pkgdir/usr/share/$pkgname" customize.dist lib scripts www
    rmdir "$pkgdir/usr/share/$pkgname/www/bower_components/codemirror/mode/rpm/changes"

    # Config
    sed -e "s|\(Path: '\)\./|\1/var/lib/cryptpad/|" \
        -e "s|'/var/lib/cryptpad/data/logs'|false|" \
        -e "s|logToStdout: false|logToStdout: true|" \
        -i config/config.example.js

    install -Dm 644 config/config.example.js "${pkgdir}/etc/webapps/$pkgname/config.example.js"
    ln -s ../../../etc/webapps/"$pkgname" "$pkgdir/usr/share/$pkgname/config"
    ln -s ../../../var/lib/"$pkgname"/{blob,block,data{,store}} "$pkgdir/usr/share/$pkgname"

    # systemd
    install -Dm 644 "${srcdir}"/cryptpad.sysusers "${pkgdir}"/usr/lib/sysusers.d/cryptpad.conf
    install -Dm 644 "${srcdir}"/cryptpad.service "${pkgdir}"/usr/lib/systemd/system/cryptpad.service
    install -Dm 644 "${srcdir}"/cryptpad.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/cryptpad.conf
}
