pkgname=erigon
pkgdesc='Ethereum implementation on the efficiency frontier.'
pkgver=2.56.1
pkgrel=2
epoch=1
url='https://github.com/ledgerwatch/erigon'
arch=('x86_64' 'aarch64')
license=('GPL3')
makedepends=('go')
depends=('glibc')
source=("https://github.com/ledgerwatch/erigon/archive/refs/tags/v2.56.1.tar.gz")
b2sums=('7ae1439ec075fe60afdd27c155fd783c1fae3ce55683c6169bd2769162779453a9ea2ca6f575f2f06fc2c14b40f8889658f6798fe4f1cf0e0480c17ff31dce52')

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
