# Maintainer:

pkgname=erigon
pkgdesc='Ethereum implementation on the efficiency frontier.'
pkgver=2.47.0
pkgrel=1
epoch=1
url='https://github.com/ledgerwatch/erigon'
arch=('x86_64')
license=('GPL3')
makedepends=('go')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ledgerwatch/erigon/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('2c8eb7bc581ab20fac836feee5d5d66aede312f84404c655d725674a6b1485cf3f62d808953de7e1bb88768c0ecc9a375a800e87a5dea734f4d906b5a7531147')

build() {
    cd ${pkgname}-${pkgver}

    export CGO_LDFLAGS="${LDFLAGS}"
    export GIT_TAG="v${pkgver}"
    make all
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
