pkgname=erigon
pkgdesc='Ethereum implementation on the efficiency frontier.'
pkgver=2.52.0
pkgrel=1
epoch=1
url='https://github.com/ledgerwatch/erigon'
arch=('x86_64' 'aarch64')
license=('GPL3')
makedepends=('go')
depends=('glibc')
source=("https://github.com/ledgerwatch/erigon/archive/refs/tags/v2.52.0.tar.gz")
b2sums=('8f500ef8a7d2cf70fca9f2a8029ae5cad6c03501f6be6eae0ee4f1669a43812f0254fbe4e8144c3b0746175b0b6c6d9781df031d8d06aea94c53fafd3ad9a476')

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
