# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=r5r
_cranver=1.0.1
pkgname=r-${_cranname,,}
pkgdesc="Rapid Realistic Routing with ‘R5’"
url="https://cran.r-project.org/package=r5r"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("any")
depends=(
    "jdk11-openjdk"
    "r-checkmate"
    "r-curl"
    "r-data.table"
    "r-httr"
    "r-jsonlite"
    "r-raster"
    "r-rjava>=0.9.10"
    "r-sf>=1.0.6"
    "r-sfheaders"
    "r-zip"
    "r>=3.6"
)
optdepends=(
    "r-covr"
    "r-dplyr"
    "r-ggplot2>=3.3.1"
    "r-gtfstools"
    "r-h3jsr>=1.3.0"
    "r-interp"
    "r-knitr"
    "r-patchwork"
    "r-rmarkdown"
)

checkdepends=(
    "${optdepends[@]}"
    "r-testthat"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("052f76d4ef0c0ef4a6e3aeeca361715e53dfea0b86394562e9acd7fdc066e442d2b12163d894293e96d1726dec2501259003b6f0be5a9f11690f26db05884460")

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

check() {
    export R_LIBS="build/"
    export NOT_CRAN=true
    R CMD check --no-manual --no-vignettes "${_cranname}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
