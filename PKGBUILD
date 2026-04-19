# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=leaflet
_pkgver=2.2.3
pkgname=r-${_pkgname,,}
pkgdesc="Create Interactive Web Maps with the JavaScript ‘Leaflet’ Library"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL3")
pkgver=${_pkgver//-/.}
pkgrel=3

arch=("any")
depends=(
    "r>=3.5"
    "r-crosstalk"
    "r-htmltools"
    "r-htmlwidgets>=1.5.4"
    "r-jquerylib"
    "r-leaflet.providers>=2.0.0"
    "r-magrittr"
    "r-png"
    "r-raster>=3.6.3"
    "r-rcolorbrewer"
    "r-rlang"
    "r-scales>=1.0.0"
    "r-sf>=0.9.6"
    "r-viridislite"
    "r-xfun"
)
optdepends=(
    "r-knitr"
    "r-maps"
    "r-purrr"
    "r-r6"
    "r-rjsonio"
    "r-rmarkdown"
    "r-s2"
    "r-shiny"
    "r-sp"
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

source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('81bb0075a5199e231b9a034733f1dfab97b19dfa8ce1e629fc92948b310cd5f44f3bd535dc164cff70218071229ef11a2ae78f2ac4cab5fb7002ce060b164286')

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}/build/"
}

# check() {
#     export R_LIBS="build/"
#     R CMD check --no-manual "${_pkgname}"
# }

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_pkgname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${_pkgname}/LICENSE" ]]; then
        install -Dm0644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
