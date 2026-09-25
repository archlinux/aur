pkgname=erigon
pkgdesc='Ethereum implementation on the efficiency frontier.'
pkgver=3.7.0
pkgrel=2
epoch=1
url='https://github.com/erigontech/erigon'
arch=('x86_64' 'aarch64')
license=('GPL3')
makedepends=('go')
depends=('glibc')
source=("https://github.com/erigontech/erigon/archive/refs/tags/v3.7.0.tar.gz")
b2sums=('d44f883bb485cd5e8ff1a9a160529e5cbea6fd7c3760890c4019937e94e80ec2c2ca63b30a78f0cdd2ef16d451c3b0880baf613710b392e307f0f7674afedf78')

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
