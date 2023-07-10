# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=sfheaders
_cranver=0.4.3
pkgname=r-${_cranname,,}
pkgdesc="Converts Between R Objects and Simple Feature Objects"
url="https://cran.r-project.org/package=sfheaders"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r>=3.0.2"
    "r-geometries>=0.2.2"
    "r-rcpp>=1.0.10"
)
optdepends=(
    "r-covr"
    "r-knitr"
)

# The unittests for `r-sfheaders` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-sfheaders`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("88217740b540a267ef8402ef719ff10ba4ffe740cdbf3ee60e819e928f733c832c36c90e38891ab2b932d4b29d8088c2958d238e87abffaa0a4a7699b81d2119")

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
