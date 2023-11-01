pkgname=erigon
pkgdesc='Ethereum implementation on the efficiency frontier.'
pkgver=2.53.4
pkgrel=2
epoch=1
url='https://github.com/ledgerwatch/erigon'
arch=('x86_64' 'aarch64')
license=('GPL3')
makedepends=('go')
depends=('glibc')
source=("https://github.com/ledgerwatch/erigon/archive/refs/tags/v2.53.4.tar.gz")
b2sums=('cd1b80f0b349ee8d1dda63f52337d97011113db7c7943182f8e01c2018353db6ea23c8cee78ac49a6019cc43a39c5193026c7f45a7d78d59a69140bd832a0d6b')

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
