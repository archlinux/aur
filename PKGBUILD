# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=gaia-hub
pkgver=2.5.3
pkgrel=1
pkgdesc="A decentralized high-performance storage system"
url="https://github.com/blockstack/gaia"
license=("MIT" "custom")
arch=("any")

depends=(
    "nodejs"
)

makedepends=(
    "npm"
    "node-gyp"
    "make"
    "typescript"
    "ts-node"
)
optdepends=(
    "nginx: utilize provided example configs"
)

source=(
    "${pkgname}::git+https://github.com/blockstack/gaia.git#tag=v${pkgver}"
    "config.json"
    "service"
    "sysusers"
    "tmpfiles"
)
sha512sums=('SKIP'
            '54c7b8e5cec9930f09541b8a5ea62971693206cc19b33f94301a9a27e4a61865f235000a30d62e93f4c399654abac0e8f7f4ee388f982f873eaffea0a011ccbd'
            '9932bc1cad558cf86f107b3069e81d4034d6c3fced6d94af899da25b7309806efcc2d2a52572a3b755c893278fd440ac6ee6b723fb8ce736bd51968096138736'
            '34c7aee63c3dc87f608019489441be0fc06299fc802d1b5d587f92f7d6c515daa384911458f7bef7db8c927e4c960052567e7b176e70e882a604776ff3b82257'
            'a71bae7d8f0e449a4bc9ea97d5f3db71c2e3511a25f6004f047b0fb2847f3490487acaf9bc9ea58b3fb71405c5172745543b3348e463a11d049e49d2ea2f7d0a')

prepare() {
    cd "$srcdir/$pkgname/hub"
    npm --cache "${srcdir}/npm-cache" install
}

build() {
    export NODE_ENV="production"
    
    cd "$srcdir/$pkgname/hub"
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
