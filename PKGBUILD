# Maintainer: Marcin Rzeźnicki <marcin.rzeznicki@gmail.com>

pkgname=berserk
pkgver=11.1
pkgrel=1
pkgdesc="UCI compliant chess engine written in C"
arch=(x86_64)
url='https://www.chessengeria.eu/berserk'
license=('GPL3')
depends=(glibc)
checkdepends=(expect)
options=(!strip)
_main_network='e3f526b26f50'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jhonnold/berserk/archive/refs/tags/${pkgver}.tar.gz"
        "https://github.com/jhonnold/berserk/releases/download/${pkgver}/berserk-${_main_network}.nn")
sha512sums=('3388c191a761536eb583affdd70efdaca21d3d938e418a62a58e4308120984b0b7e38965dfe0751a9148bd0de17e1a0f19bba39782ebd351b92701cb53af636b'
            'bfea7794d9954207a15e6eb05e85a0548e9f60ece596904b3f21f1337e109a583d6f53e676095fcc7ea9d3a11fd8d28179eb5d17b7a19cdf5de69e709bc86cb1')

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
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/src/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
