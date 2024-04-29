# Maintainer: peippo <christoph+aur@christophfink.com>
# Maintainer: Alex Branham <branham@utexas.edu>

_cranname=debugme
_cranver=1.2.0
pkgname=r-${_cranname,,}
pkgdesc="Specify debug messages as special string constants, and control
debugging of packages via environment variables."
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r>=3.6"
    "r-crayon"
)
optdepends=(
    "r-covr"
    "r-mockery"
    "r-r6"
    "r-withr"
)

# The unittests for `r-debugme` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-debugme`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat>=3.0.0"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("2322eb2726f06af4d89cdc05a11cb5a2b011e484d16a4f2b9941549769bf6bb30b2cee8272263ec72bc1a62a411ea70a7a449101d94184c9b9df89acd73da762")

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
