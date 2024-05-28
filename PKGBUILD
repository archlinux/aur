# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=RPostgres
_cranver=1.4.7
pkgname=r-${_cranname,,}
pkgdesc="Fully DBI-compliant C++-backed interface to PostgreSQL"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL-3.0-only")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "libpq.so"
    "r-bit64"
    "r-blob>=1.2.0"
    "r-dbi>=1.2.0"
    "r-hms>=1.1.0"
    "r-lubridate"
    "r-plogr>=0.0.2"
    "r-cpp11"
    "r-withr"
    "r>=3.1.0"
)
makedepends=(
    "r-decor"
)
optdepends=(
    "r-callr"
    "r-covr"
    "r-dbitest>=1.7.3"
    "r-knitr"
    "r-rlang"
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
b2sums=("45a98d058d5b8699b5c82e696fe6f8b1e92b4bf5129d8893befe92b3d08fadc661fce8466df145ca2e835212d267da6a8b5681d9892255adf9c4ce4b450b9c87")

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
