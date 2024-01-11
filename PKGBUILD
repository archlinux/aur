pkgname=erigon
pkgdesc='Ethereum implementation on the efficiency frontier.'
pkgver=2.56.2
pkgrel=2
epoch=1
url='https://github.com/ledgerwatch/erigon'
arch=('x86_64' 'aarch64')
license=('GPL3')
makedepends=('go')
depends=('glibc')
source=("https://github.com/ledgerwatch/erigon/archive/refs/tags/v2.56.2.tar.gz")
b2sums=('ee42fcfc3ded08244fa929acca666d82ece7a93ca49c0bb77de11c787f455c50b6291c5dcb985146a1e2cf3e30344de7333afd7bbd38db2c9f39d49d0227b6ea')

build() {
    cd ${pkgname}-${pkgver}

    export CGO_LDFLAGS="$LDFLAGS"
    export GIT_TAG="v${pkgver}"
    make erigon devnet downloader integration rpcdaemon sentry txpool sentinel caplin
}

package() {
    cd ${pkgname}-${pkgver}

    for binary in build/bin/*; do
        filename=${binary##*/}
        if [[ "${filename}" = "erigon" ]]; then
            install -Dm755 "${binary}" "${pkgdir}/usr/bin/${filename}"
        else
            install -Dm755 "${binary}" "${pkgdir}/usr/bin/erigon-${filename}"
        fi
    done
}
