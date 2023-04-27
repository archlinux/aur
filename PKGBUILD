# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=s2
_cranver=1.1.3
pkgname=r-${_cranname,,}
pkgdesc="Spherical Geometry Operators Using the S2 Geometry Library"
url="https://cran.r-project.org/package=s2"
license=(Apache)
pkgver=${_cranver//[:-]/.}
pkgrel=3

arch=("i686" "x86_64")
depends=(
    "openssl>=1.0.1"
    "r>=3.0.0"
    "r-rcpp"
    "r-wk>=0.6.0"
)
optdepends=(
    "r-bit64"
    "r-vctrs"
)

# The unittests for `r-s2` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-s2`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat>=3.0.0"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("51ca1a72931a7f37f64d7e7c2592ba10965ab7be6cfb0504f1000bfb11c7f71f61c719a40a371456550c4513de15102ce86ff59a870ca73881e3f778896c83d8")

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
