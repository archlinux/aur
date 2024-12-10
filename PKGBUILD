# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=parsedate
_cranver=1.3.2
pkgname=r-${_cranname,,}
pkgdesc="Recognize and Parse Dates in Various Formats"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL2")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r"
)
optdepends=(
    "r-covr"
    "r-withr"
)

checkdepends=(
    "${optdepends[@]}"
    "r-testthat"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("645c116366797f812c0033c41e87fea7cfe0bcdbb916e9f418fd97c6b753cbd037cc40f215eb368e079dbc20ac19c64d53f66da603ef47a8b83bb70063a839ae")

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

check() {
    export R_LIBS="build/"
    R CMD check --no-manual "${_cranname}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
