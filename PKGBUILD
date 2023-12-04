pkgname=erigon
pkgdesc='Ethereum implementation on the efficiency frontier.'
pkgver=2.55.0
pkgrel=2
epoch=1
url='https://github.com/ledgerwatch/erigon'
arch=('x86_64' 'aarch64')
license=('GPL3')
makedepends=('go')
depends=('glibc')
source=("https://github.com/ledgerwatch/erigon/archive/refs/tags/v2.55.0.tar.gz")
b2sums=('fda8180051db4fc6afa3967a335f5ed4b37d3ef17fe8943319410a68d7a131e61f5c604b6faa5173b515c0156b0d8a2b937141ab79c186e73fa8a7c1c2633182')

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
