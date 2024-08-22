# Maintainer: Marcin Rzeźnicki <marcin.rzeznicki@gmail.com>

pkgname=rubichess
_pkgname='RubiChess'
pkgver=20240817
pkgrel=1
pkgdesc="Just another UCI compliant chess engine"
arch=(x86_64)
url='https://github.com/Matthies/RubiChess'
license=('GPL3')
depends=(glibc zlib gcc-libs)
makedepends=(git clang)
options=(!strip !buildflags)
_tag=${pkgver}
_rubinet='nn-bc638d5ec9-20240730.nnue'
source=("git+https://github.com/Matthies/${_pkgname}#tag=${_tag}"
        "https://github.com/Matthies/NN/raw/main/${_rubinet}"
        "rubichess-use-system-zlib.patch")
sha512sums=('SKIP'
            '723d0a7f05051329f96f0e627bd611730c0d1b1090523ef7a03e31b2fea18d58324aedd28954f0e828534f30490788f3c03152e196583cbd845ef031f3a567d3'
            '48195656e718ddc1513727f9342747600280129780b78727831a45c444dbe09170bceaa918d71beb1a99f347e1d320c3b303ae63cfd2845b9a5cfc83e0ae065c')

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
