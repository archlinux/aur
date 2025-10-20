pkgname=erigon
pkgdesc='Ethereum implementation on the efficiency frontier.'
pkgver=3.2.1
pkgrel=2
epoch=1
url='https://github.com/erigontech/erigon'
arch=('x86_64' 'aarch64')
license=('GPL3')
makedepends=('go')
depends=('glibc')
source=("https://github.com/erigontech/erigon/archive/refs/tags/v3.2.1.tar.gz")
b2sums=('e13f998ea6417e9c12c35c9975e8ec5b9b5a1cdb25600767b57906e7b9cc35a855e992696827e29878fe551de18e80a93e32df14bba60c5a247b0d23f998853b')

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
