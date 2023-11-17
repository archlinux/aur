# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=leaflet
_cranver=2.2.1
pkgname=r-${_cranname,,}
pkgdesc="Create Interactive Web Maps with the JavaScript ‘Leaflet’ Library"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL3")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r>=3.1.0"
    "r-crosstalk"
    "r-htmltools"
    "r-htmlwidgets>=1.5.4"
    "r-jquerylib"
    "r-leaflet.providers>=2.0.0"
    "r-magrittr"
    "r-png"
    "r-raster>=3.6.3"
    "r-rcolorbrewer"
    "r-scales>=1.0.0"
    "r-sp"
    "r-viridis>=0.5.1"
    "r-xfun"
)
optdepends=(
    "r-knitr"
    "r-maps"
    "r-purrr"
    "r-r6"
    "r-rjsonio"
    "r-s2"
    "r-sf>=0.9.6"
    "r-shiny"
    "r-terra"
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

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat>=3.0.0"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("1849ed58e86a89e1301acdba5102cee5086ce06d083f1e4bae91d10cb23934bd21dcc4549f6c02e01a53a4eba474c0455b6d2b6fb01296a2f6a3d91de06e2877")

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

# check() {
#     export R_LIBS="build/"
#     R CMD check --no-manual "${_cranname}"
# }

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
