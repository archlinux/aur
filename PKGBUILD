# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=gaia-hub
pkgver=2.6.0
pkgrel=1
pkgdesc="A decentralized high-performance storage system"
arch=("any")
url="https://github.com/blockstack/gaia"
license=("custom:MIT")

depends=("nodejs")
makedepends=("npm"
             "node-gyp"
             "make"
             "typescript"
             "ts-node")
optdepends=("nginx: utilize provided example configs")

source=("${pkgname}::git+https://github.com/blockstack/gaia.git#tag=v${pkgver}"
        "config.json"
        "service"
        "sysusers"
        "tmpfiles")
sha512sums=('SKIP'
            'dcb22abf9ec89ff88882f493ad6e684637bf0c6dad0f3d9971e1db300882922167d39bc98f3fa937398eba1c449ee2ecf2661eb3c6f50b826262700f5baf8397'
            '9932bc1cad558cf86f107b3069e81d4034d6c3fced6d94af899da25b7309806efcc2d2a52572a3b755c893278fd440ac6ee6b723fb8ce736bd51968096138736'
            '34c7aee63c3dc87f608019489441be0fc06299fc802d1b5d587f92f7d6c515daa384911458f7bef7db8c927e4c960052567e7b176e70e882a604776ff3b82257'
            '3b77e638815acc2eebd9a0480d20100a0dfef9cecaeb12f4c45fa8624cd7d96c3ae6b5c5a741d656f47d7df9c019862a3a5dddb8e3e4ca47c22d34a16f669d18')


prepare() {
    cd "$srcdir/$pkgname/hub"

    npm --cache "${srcdir}/npm-cache" install
}

build() {
    cd "$srcdir/$pkgname/hub"

    export NODE_ENV="production"
    npm run build
}

package() {
    cd "$srcdir/$pkgname/hub"

    install -d "${pkgdir}/etc/gaia/hub" "${pkgdir}/usr/lib/node_modules/gaia-hub" "${pkgdir}/usr/bin"

    # Install data
    cp -r "lib" "node_modules" "${pkgdir}/usr/lib/node_modules/gaia-hub/"
    chmod 755 "${pkgdir}/usr/lib/node_modules/gaia-hub/lib/index.js"
    # link executable
    ln -s "/usr/lib/node_modules/gaia-hub/lib/index.js" "${pkgdir}/usr/bin/gaia-hub"

    # install custom default config
    install -Dm 644 "${srcdir}/config.json" "${pkgdir}/usr/lib/node_modules/gaia-hub/config.json"
    ln -s "/usr/lib/node_modules/gaia-hub/config.json" "${pkgdir}/etc/gaia/hub/config.json"
    install -Dm 644 "config-schema.json" "${pkgdir}/usr/lib/node_modules/gaia-hub/config-schema.json"

    # install examples
    install -Dm 644 "nginx.conf" "${pkgdir}/usr/share/doc/gaia/hub/nginx.conf.example"
    for file in etc/*.json; do
        install -m 644 "$file" "${pkgdir}/usr/share/doc/gaia/hub/"
    done

    # install documentation and license
    install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/gaia/hub/README.md"
    install -Dm 644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/gaia/hub/CHANGELOG.md"
    install -Dm 644 "../LICENSE" "${pkgdir}/usr/share/licenses/gaia/LICENSE"

    # Install sysusers
    install -Dm644 "$srcdir/sysusers" "$pkgdir/usr/lib/sysusers.d/${pkgname}.conf"

    # Install tmpfiles
    install -Dm644 "$srcdir/tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname}.conf"

    # install service
    install -Dm 644 "${srcdir}/service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
