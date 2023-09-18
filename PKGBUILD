# Maintainer: Marcin Rzeźnicki <marcin.rzeznicki@gmail.com>

pkgname=rubichess
_pkgname='RubiChess'
pkgver=20230918
pkgrel=1
pkgdesc="Just another UCI compliant chess engine"
arch=(x86_64)
url='https://github.com/Matthies/RubiChess'
license=('GPL3')
depends=(glibc zlib gcc-libs)
makedepends=(git clang)
options=(!strip !buildflags)
_tag=${pkgver}
_rubinet='nn-c257b2ebf1-20230812.nnue'
source=("git+https://github.com/Matthies/${_pkgname}#tag=${_tag}"
        "https://github.com/Matthies/NN/raw/main/${_rubinet}"
        "rubichess-use-system-zlib.patch")
sha512sums=('SKIP'
            '01b69ef709404737e684c364d275ea3fd5bfb430311080bb61e2c99ed868918db30e7a75516db1f85fa12118c02e86bb5a0b76285c096607ca1ed612d3837057'
            'd7656de253146c0d522e5324884c32056f2922c32fdfebfe2f0268594a4c16a8d19f755678fa24a98200a53d872b95863d1fae5a781622b29450e10229fcb2f2')

prepare() {
    cd ${_pkgname}
    ln -sf "${srcdir}/${_rubinet}" "src/${_rubinet}"
    git apply "${srcdir}/rubichess-use-system-zlib.patch"
}

build() {
    cd "${_pkgname}"
    cd src
    make COMP=clang EVALFILE="${_rubinet}" build
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/src/RubiChess" "${pkgdir}/usr/bin/${_pkgname}"
}
