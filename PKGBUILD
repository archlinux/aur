# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=leaflet
_cranver=2.1.2
pkgname=r-${_cranname,,}
pkgdesc="Create Interactive Web Maps with the JavaScript ‘Leaflet’ Library"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL3")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r-base64enc"
    "r-crosstalk"
    "r-htmltools"
    "r-htmlwidgets>=1.5.4"
    "r-leaflet.providers>=1.8.0"
    "r-magrittr"
    "r-markdown"
    "r-png"
    "r-raster"
    "r-rcolorbrewer"
    "r-scales>=1.0.0"
    "r-sp"
    "r-viridis>=0.5.1"
    "r>=3.1.0"
)
optdepends=(
    "r-knitr"
    "r-purrr"
    "r-r6"
    "r-rgdal"
    "r-rgeos"
    "r-rjsonio"
    "r-s2"
    "r-sf>=0.9.6"
    "r-shiny"
    "r-testthat>=3.0.0"
)
checkdepends=(
    "${optdepends[@]}"
    "r-testthat>=3.0.0"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('64dcf4edbcd8e4318c54fda03eff193f7a39ce309cdadf53bee628b78a642bbc6df6a29f7f5ff48178465057d08012fd105156c61f59a18c33d41fca01a2cabd')

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

check() {
    cd "${srcdir}/${_cranname}/tests"
    R_LIBS="${srcdir}/build/" Rscript --vanilla testthat.R
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
