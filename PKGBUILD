# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=exactextractr
_cranver=0.10.0
pkgname=r-${_cranname,,}
pkgdesc="Fast Extraction from Raster Datasets using Polygons"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

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

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("df62e60707257c2a2a814d8b6ebb649bfd1972f123ffb052c69084e10596e280537ab39e0360dde6eeadfdca0f25d699f01750d592bce00c8331684a851513bc")

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
