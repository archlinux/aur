# Maintainer: Marcin Rzeźnicki <marcin.rzeznicki@gmail.com>

pkgname=rubichess
_pkgname='RubiChess'
pkgver=20230410
pkgrel=2
pkgdesc="Just another UCI compliant chess engine"
arch=(x86_64)
url='https://github.com/Matthies/RubiChess'
license=('GPL3')
depends=(glibc zlib gcc-libs)
makedepends=(git clang)
options=(!strip !buildflags)
_tag=${pkgver}
_rubinet='nn-d901a1822f-20230606.nnue'
source=("git+https://github.com/Matthies/${_pkgname}#tag=${_tag}"
        "https://github.com/Matthies/NN/raw/main/${_rubinet}"
        "rubichess-use-system-zlib.patch")
sha512sums=('SKIP'
            '1052609e9e66b9331740b92d63bb1a99bf11eae1efa85e45279cdc020e24624136fd7025bfa0f1e7bdfdc8f92408ff31ee4de88edc75b35d787aca998ce282ae'
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
