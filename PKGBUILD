# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=Lahman
_cranver=11.0-0
pkgname=r-${_cranname,,}
pkgdesc="Sean ‘Lahman’ Baseball Database"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL2" "GPL3")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r-dplyr"
    "r>=3.5.0"
)
optdepends=(
    "r-car"
    "r-data.table"
    "r-ggplot2"
    "r-googlevis"
    "r-knitr"
    "r-lattice"
    "r-reshape2"
    "r-rmarkdown"
    "r-tidyr"
    "r-vcd"
)
checkdepends=(
    "${optdepends[@]}"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("68d9250bf8f7c9d422e927cd5c798c739b6e297a6a3c90a443e3d03462fb7dd34019e1d6b6780666c4256c30bd4109c0aa5ee28cf44826e6c19ae5e4630e2c3c")

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
