# Maintainer: Marcin Rzeźnicki <marcin.rzeznicki@gmail.com>

pkgname=rubichess
_pkgname='RubiChess'
pkgver=20230410
pkgrel=1
pkgdesc="Just another UCI compliant chess engine"
arch=(x86_64)
url='https://github.com/Matthies/RubiChess'
license=('GPL3')
depends=(glibc zlib gcc-libs)
makedepends=(git clang)
options=(!strip !buildflags)
_tag=${pkgver}
_rubinet='nn-fdccaaabd3-20230314.nnue'
source=("git+https://github.com/Matthies/${_pkgname}#tag=${_tag}"
        "https://github.com/Matthies/NN/raw/main/${_rubinet}"
        "${pkgname}-use-system-zlib.patch")
sha512sums=('SKIP'
            '062a88aeb0067a2053978905b70d2a3ef1352c7229acf0d40ee820fa45f82ba671e81a3895f8230d9f12c7cc44df1a1a0070d913fcf017c6739f05d41804883b'
            'd7656de253146c0d522e5324884c32056f2922c32fdfebfe2f0268594a4c16a8d19f755678fa24a98200a53d872b95863d1fae5a781622b29450e10229fcb2f2')

prepare() {
    cd ${_pkgname}
    ln -sf "${srcdir}/${_rubinet}" "src/${_rubinet}"
    git apply "${srcdir}/${pkgname}-use-system-zlib.patch"
}

build() {
    cd "${_pkgname}"
    cd src
    make COMP=clang EVALFILE="${_rubinet}" build
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/src/RubiChess" "${pkgdir}/usr/bin/${_pkgname}"
}
