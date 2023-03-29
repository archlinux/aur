# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=RPostgres
_cranver=1.4.5
pkgname=r-${_cranname,,}
pkgdesc="Rcpp Interface to PostgreSQL"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL3")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "libpq.so"
    "r-bit64"
    "r-blob>=1.2.0"
    "r-dbi>=1.1.0"
    "r-hms>=1.1.0"
    "r-lubridate"
    "r-plogr>=0.0.2"
    "r-rcpp>=1.0.7"
    "r-withr"
    "r>=3.1.0"
)
optdepends=(
    "r-callr"
    "r-covr"
    "r-dbitest>=1.7.2.9001"
    "r-knitr"
    "r-rmarkdown"
)

# The unittests for `r-rpostgres` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-rpostgres`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat>=3.0.0"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("e682c3f808d83c0cfc44dfe8a0cfc358666717135a5c09abadfed074f21008bd3531a188408515721127e0d029d84316110650832b72592bbcc3161e0d57f0e5")

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
