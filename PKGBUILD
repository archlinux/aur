pkgname=erigon
pkgdesc='Ethereum implementation on the efficiency frontier.'
pkgver=3.3.8
pkgrel=2
epoch=1
url='https://github.com/erigontech/erigon'
arch=('x86_64' 'aarch64')
license=('GPL3')
makedepends=('go')
depends=('glibc')
source=("https://github.com/erigontech/erigon/archive/refs/tags/v3.3.8.tar.gz")
b2sums=('a7d050dcc96e28eb4388a27c7a734a55343e2fe7acc9cd2ba5813f184d90a3f40c3e79880373980c73ed130581139f31811d4bf8729a323def2a7fa84bd1e2b8')

build() {
    cd ${pkgname}-${pkgver}

    export CGO_LDFLAGS="$LDFLAGS"
    export GIT_TAG="v${pkgver}"
    make erigon downloader integration rpcdaemon sentry txpool sentinel caplin
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
