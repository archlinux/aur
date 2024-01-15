# Maintainer: Marcin Rzeźnicki <marcin.rzeznicki@gmail.com>

pkgname=rubichess
_pkgname='RubiChess'
pkgver=20240112
pkgrel=2
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
        "rubichess-use-system-zlib.patch"
        "rubichess-fix-build-def.patch")
sha512sums=('SKIP'
            '01b69ef709404737e684c364d275ea3fd5bfb430311080bb61e2c99ed868918db30e7a75516db1f85fa12118c02e86bb5a0b76285c096607ca1ed612d3837057'
            '48195656e718ddc1513727f9342747600280129780b78727831a45c444dbe09170bceaa918d71beb1a99f347e1d320c3b303ae63cfd2845b9a5cfc83e0ae065c'
            '6b75b75b44af74f13bade246c5208929a7f53a0eeafa9f4e16d6ce67b32c99aa96a9108fffbfab54eb88167a6a0459ab5509a41729f35d2cfb4ebf7f2e7b4498')

prepare() {
    cd ${_pkgname}
    ln -sf "${srcdir}/${_rubinet}" "src/${_rubinet}"
    git apply "${srcdir}/rubichess-use-system-zlib.patch"
    git apply "${srcdir}/rubichess-fix-build-def.patch"
}

build() {
    cd "${_pkgname}"
    cd src
    make COMP=clang EVALFILE="${_rubinet}" build
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/src/RubiChess" "${pkgdir}/usr/bin/${_pkgname}"
}
