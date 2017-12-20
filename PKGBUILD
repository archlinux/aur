# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=(cardano-sl daedalus-bridge)
pkgver=1.0.3
_commit=0c1fab91a7358fcb4c151a3a028ed650f7a36cbd
pkgrel=2
pkgdesc='Cryptographic currency implementing Ouroboros PoS protocol'
arch=('x86_64')
url='https://github.com/input-output-hk/cardano-sl/'
license=('MIT')
makedepends=('git' 'ncurses5-compat-libs' 'npm' 'stack')
source=("git+https://github.com/input-output-hk/cardano-sl.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
    cd ${pkgname}

    stack build --ghc-build=tinfo6

    # Build Daedalus Bridge
    stack exec --ghc-build=tinfo6 -- cardano-wallet-hs2purs
    cd daedalus
    npm install
    npm run build:prod
}

package_cardano-sl() {
    pkgdesc='Cryptographic currency implementing Ouroboros PoS protocol'
    depends=('gmp' 'openssl' 'rocksdb')

    cd ${pkgname}

    stack install --ghc-build=tinfo6 --local-bin-path="${pkgdir}/usr/bin"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_daedalus-bridge() {
    pkgdesc='Cryptographic currency implementing Ouroboros PoS protocol'

    cd cardano-sl

    install -dm755 "${pkgdir}/usr/lib/node_modules/daedalus-client-api"
    cp -r daedalus/* "${pkgdir}/usr/lib/node_modules/daedalus-client-api"
    install -Dm644 -t "${pkgdir}/usr/lib/node_modules/daedalus-client-api" \
        log-config-prod.yaml \
        node/configuration.yaml \
        node/*genesis*.json
}
