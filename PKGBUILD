# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=jsonify
_cranver=1.2.2
pkgname=r-${_cranname,,}
pkgdesc="Convert Between 'R' Objects and Javascript Object Notation (JSON)"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("i686" "x86_64")
depends=(
    "r>=3.3.0"
    "r-rcpp>=0.12.18"
    "r-rapidjsonr>=1.2.0"
)
optdepends=(
    "r-covr"
    "r-knitr"
    "r-rmarkdown"
)

# The unittests for `r-jsonify` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-jsonify`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("2c25f09270c66e8b8a0e6925666240c3d4062ff234c08b16760ea2b74d331f02b9ec84bfc9ddd03407065b8ec6b489319a77340daf73468392ce42b7ecc5ae22")

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
