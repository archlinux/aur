# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=gtfsio
_cranver=1.1.0
pkgname=r-${_cranname,,}
pkgdesc="Read and Write General Transit Feed Specification (GTFS) Files"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("any")
depends=(
    "r"
    "r-data.table"
    "r-zip"
)
optdepends=(
    "r-knitr"
    "r-rmarkdown"
)

# The unittests for `r-gtfsio` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-gtfsio`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-rcmdcheck"
#     "r-tinytest"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("43ed6035bcb68b1d42fab7eb6bf90f91dcb24317feca07d5a3b0c34d955ded7c0e14941288e92fb925ab16be8816a291dd471706ee09223d5ccb8ee32ecdfd60")

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
