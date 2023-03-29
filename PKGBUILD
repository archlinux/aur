# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=Lahman
_cranver=10.0-1
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
b2sums=("b2e8d887f828705e421938694ec77792eae9f8d5c612723feb2602e637a9a905eee8f86d6e74bef07cea5b6680169e1b72af3516b27914f90e4e88bb0563dcb5")

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
