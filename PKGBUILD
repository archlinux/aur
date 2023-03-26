# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=sfheaders
_cranver=0.4.2
pkgname=r-${_cranname,,}
pkgdesc="Converts Between R Objects and Simple Feature Objects"
url="https://cran.r-project.org/package=sfheaders"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=3

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
b2sums=("2652abb2afda69455faab4b74ae28f397a83793cdc387a00b001f7535bc8ee220534a52cf0d78896c084ca9173af177e0a03394d0594521f13ac4310bfebca2b")

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
