pkgname=erigon
pkgdesc='Ethereum implementation on the efficiency frontier.'
pkgver=3.3.3
pkgrel=2
epoch=1
url='https://github.com/erigontech/erigon'
arch=('x86_64' 'aarch64')
license=('GPL3')
makedepends=('go')
depends=('glibc')
source=("https://github.com/erigontech/erigon/archive/refs/tags/v3.3.3.tar.gz")
b2sums=('a66c6ff41c6b95d9d6d270b99ed75f6015a187754313614e14fa565b7f6cff4c0fc3e9722b9dc62be044a83793e94453de56dc6ac6f3f73c8825051f7294a265')

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
