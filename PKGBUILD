# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Christian Pfeiffer <ChrisTX>
# Contributor: Giovanni Harting <539@idlegandalf.com>

pkgname=cryptpad
pkgver=5.2.0
pkgrel=1
pkgdesc="Realtime collaborative visual editor with zero knowlege server"
arch=('any')
url="https://github.com/xwiki-labs/cryptpad"
license=(AGPL3)
depends=(nodejs)
makedepends=(bower npm git)
optdepends=('nginx: HTTP server providing TLS'
            'certbot: Let’s Encrypt – automatically receive and install X.509 certificates to enable TLS'
            'certbot-nginx: Nginx plugin for Let’s Encrypt client')
backup=(etc/webapps/"$pkgname"/config.js
        etc/nginx/sites-available/"$pkgname".conf)
options=(!strip) # There are no ELF files, no need to strip anything.
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "cryptpad.service"
        "cryptpad.sysusers"
        "cryptpad.tmpfiles")
sha256sums=('f611df046d42cdc50b919620b6145e5f8451ed076d77b757f5c2a5319557f71f'
            '792da71f113aa15177a654e08a31dabd9be864ceb42f64d55cc46d18875c475b'
            '999a271d64b75c7c447fdb21486b27463c04679677e57ea9551a3b0429c618f6'
            '986c1a67e5a00b9a766798933f1774995736a0ed345427509bdc522ad71d7e93')

build() {
    cd "$pkgname-$pkgver"
    export NODE_ENV=production
    npm install --cache "$srcdir"/npm-cache
    bower install -p --allow-root
}

package() {
    cd "$pkgname-$pkgver"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"

    # remove unneeded man pages
    sed -i '/"man/d' www/bower_components/marked/package.json
    rm -r www/bower_components/marked/man

    # Remove references to $srcdir
    find . -type f -name package.json -print0 | xargs -0 sed -i '/_where/d'

    # Documentation
    install -t "$pkgdir/usr/share/doc/$pkgname" -Dm 644 docs/{ARCHITECTURE.md,example.nginx.conf} CHANGELOG.md

    # Cryptpad
    install -Dt "$pkgdir/usr/share/webapps/$pkgname" package.json server.js
    cp -rt "$pkgdir/usr/share/webapps/$pkgname" customize.dist lib node_modules scripts www
    rmdir "$pkgdir/usr/share/webapps/$pkgname/www/bower_components/codemirror/mode/rpm/changes"

    # Config
    sed -e "s|\(Path: '\)\./|\1/var/lib/cryptpad/|" \
        -e "s|'/var/lib/cryptpad/data/logs'|false|" \
        -e "s|logToStdout: false|logToStdout: true|" \
        -i config/config.example.js
    install -Dm 644 config/config.example.js "${pkgdir}/etc/webapps/$pkgname/config.js"

    # Nginx config
    sed -Ee "s|^( *root  *)/.*|\1/usr/share/webapps/$pkgname/www;|" \
        -e "s|/home/cryptpad/.acme.sh/|/etc/letsencrypt/live/|" \
        -i docs/example.nginx.conf
    install -Dm 644 docs/example.nginx.conf "${pkgdir}/etc/nginx/sites-available/$pkgname.conf"

    ln -s /etc/webapps/"$pkgname" "$pkgdir/usr/share/webapps/$pkgname/config"
    install -dm 750 "$pkgdir/var/lib/$pkgname"/{,blob,block,data{,store},logs}
    ln -s /var/lib/"$pkgname"/{blob,block,data{,store}} "$pkgdir/usr/share/webapps/$pkgname"

    # systemd
    install -Dm 644 "${srcdir}"/cryptpad.sysusers "${pkgdir}"/usr/lib/sysusers.d/cryptpad.conf
    install -Dm 644 "${srcdir}"/cryptpad.service "${pkgdir}"/usr/lib/systemd/system/cryptpad.service
    install -Dm 644 "${srcdir}"/cryptpad.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/cryptpad.conf
}
