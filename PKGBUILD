# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=leaflet
_cranver=2.1.2
pkgname=r-${_cranname,,}
pkgdesc="Create Interactive Web Maps with the JavaScript ‘Leaflet’ Library"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL3")
pkgver=${_cranver//[:-]/.}
pkgrel=3

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
    "r-maps"
    "r-purrr"
    "r-r6"
    "r-rgdal"
    "r-rgeos"
    "r-rjsonio"
    "r-s2"
    "r-sf>=0.9.6"
    "r-shiny"
)

# The unittests for `r-leaflet` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-leaflet`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

checkdepends=(
    "${optdepends[@]}"
    "r-testthat>=3.0.0"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("64dcf4edbcd8e4318c54fda03eff193f7a39ce309cdadf53bee628b78a642bbc6df6a29f7f5ff48178465057d08012fd105156c61f59a18c33d41fca01a2cabd")

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
