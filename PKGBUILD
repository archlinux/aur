pkgname=erigon
pkgdesc='Ethereum implementation on the efficiency frontier.'
pkgver=3.0.7
pkgrel=2
epoch=1
url='https://github.com/erigontech/erigon'
arch=('x86_64' 'aarch64')
license=('GPL3')
makedepends=('go')
depends=('glibc')
source=("https://github.com/erigontech/erigon/archive/refs/tags/v3.0.7.tar.gz")
b2sums=('ea89c0c38527d4b9c97e3f9188e92ce7660afa2dbda63b4ff189342478af931164b61f37e10c874d33e1d4e46100cc32e5c38d046a13d60d1c6331efe6d90f3f')

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
