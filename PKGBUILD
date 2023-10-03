# Maintainer:

pkgname=erigon
pkgdesc='Ethereum implementation on the efficiency frontier.'
pkgver=2.50.2
pkgrel=1
epoch=1
url='https://github.com/ledgerwatch/erigon'
arch=('x86_64')
license=('GPL3')
makedepends=('go')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ledgerwatch/erigon/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('bd4d5d952799f683c8d5182aa0e3fe5d5a704cbdff45e2102b7398db4e942d5ac6af4ecf675a5f370dbd4cbb283705049c91020a488bfef8723da16912dfe8ee')

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
