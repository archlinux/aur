# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=anytime
_cranver=0.3.10
pkgname=r-${_cranname,,}
pkgdesc="Anything to ‘POSIXct’ or ‘Date’ Converter"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("i686" "x86_64")
depends=(
    "r>=3.2.0"
    "r-bh"
    "r-rcpp>=0.12.9"
)
optdepends=(
    "r-gettz"
)

checkdepends=(
    "${optdepends[@]}"
    "texlive-latex"
    "r-tinytest"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("755165811f3b0308ace168203562a1cabda43718f224d67a3f253671c2cc59e8aa419fe09e71784abf2e47e3c3e4526976e62fe3d2bae7ed20891b35e0d034e8")

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
