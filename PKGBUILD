# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=exactextractr
_pkgver=0.10.1
pkgname=r-${_pkgname,,}
pkgdesc="Fast Extraction from Raster Datasets using Polygons"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=2

arch=("i686" "x86_64")
depends=(
    "geos>=3.5.0"
    "r-raster"
    "r-rcpp>=0.12.12"
    "r-sf>=0.9.0"
    "r>=3.4.0"
)
optdepends=(
    "r-dplyr"
    "r-foreign"
    "r-knitr"
    "r-ncdf4"
    "r-rmarkdown"
    "r-terra>=1.5.17"
)

# The unittests for `r-exactextractr` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-exactextractr`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat"
# )

source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('c607844b1d512d4bea830712da3153d419c1e537adc8c6fd6b2b7b439fa61c2d4c34ebbbbf86dc768c1ba9e11c392fb3b925bbbf683513bfbf7642c923abfcf9')

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
