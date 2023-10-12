pkgname=erigon
pkgdesc='Ethereum implementation on the efficiency frontier.'
pkgver=2.52.1
pkgrel=1
epoch=1
url='https://github.com/ledgerwatch/erigon'
arch=('x86_64' 'aarch64')
license=('GPL3')
makedepends=('go')
depends=('glibc')
source=("https://github.com/ledgerwatch/erigon/archive/refs/tags/v2.52.0.tar.gz")
b2sums=('f06dbcdaa2473c66aaa528fadcedfe39885d514a3459406ec9167ce7d19b708d8ad753131aff5d91dffab4c4e1754d77a45e98d6ad5abc7a22ec6dabb8a38a31')

build() {
    cd ${pkgname}-${pkgver}

    export CGO_LDFLAGS="$LDFLAGS"
    export GIT_TAG="v${pkgver}"
    make erigon devnet downloader integration rpcdaemon sentry txpool sentinel caplin-phase1
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
