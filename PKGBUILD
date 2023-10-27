# Maintainer: Marcin Rzeźnicki <marcin.rzeznicki@gmail.com>

pkgname=berserk
pkgver=12
pkgrel=1
pkgdesc="UCI compliant chess engine written in C"
arch=(x86_64)
url='https://www.chessengeria.eu/berserk'
license=('GPL3')
depends=(glibc)
checkdepends=(expect)
options=(!strip)
_main_network='fb675dad41b4'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jhonnold/berserk/archive/refs/tags/${pkgver}.tar.gz"
        "https://github.com/jhonnold/berserk/releases/download/${pkgver}/berserk-${_main_network}.nn")
sha512sums=('3a8af9ea9b3bbbe93aa9e24a81855fc5e9432e517f677e3012ce805dc480d6791c309dc50b02dee13c2718dc6bf18f908cb6a31147af8ea041ea6e2dbe61fc25'
            '7f2adf7d7b721ab3c63cbd51480554dcbd16d6236eeb2c55e6606574d8950ccb68f0d3205eb2aa9e99d6f051648f182e4d8e72b3309ad2c54cf1fe09b24819db')

prepare() {
    ln -sf "${srcdir}/berserk-${_main_network}.nn" "${pkgname}-${pkgver}/src/networks/main_network.nn"
}

build() {
    cd "${pkgname}-${pkgver}"
    cd src
    make EVALFILE="networks/main_network.nn" basic
}

check() {
   cd "${pkgname}-${pkgver}"
   ./tests/perft.sh
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/src/berserk" "${pkgdir}/usr/bin/${pkgname}"
}
