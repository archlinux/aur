pkgname=erigon
pkgdesc='Ethereum implementation on the efficiency frontier.'
pkgver=2.51.0
pkgrel=1
epoch=1
url='https://github.com/ledgerwatch/erigon'
arch=('x86_64' 'aarch64')
license=('GPL3')
makedepends=('go')
depends=('glibc')
source=("https://github.com/ledgerwatch/erigon/archive/refs/tags/v2.51.0.tar.gz")
b2sums=('a5b93d8c03627785bee39a4e27b9a69396c8a7657dcdedd43b09fdb8b85b016749f12aa4e937be470de2ee56f337545577611596a04024508fb0911dc42689ed')

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
