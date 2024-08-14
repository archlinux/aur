pkgname=erigon
pkgdesc='Ethereum implementation on the efficiency frontier.'
pkgver=2.60.6
pkgrel=2
epoch=1
url='https://github.com/ledgerwatch/erigon'
arch=('x86_64' 'aarch64')
license=('GPL3')
makedepends=('go')
depends=('glibc')
source=("https://github.com/ledgerwatch/erigon/archive/refs/tags/v2.60.6.tar.gz")
b2sums=('1482f274b03f874f4391110821f7d4b64baa9e9f9d04114c640f7556268bcee2d6f9adcda922747b31cc3cc4b9b07e79817717db3d66370a596b6263548d4c4d')

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
