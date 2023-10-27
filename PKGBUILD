# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=RMariaDB
_cranver=1.3.1
pkgname=r-${_cranname,,}
pkgdesc="Database Interface and MariaDB Driver"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "libmariadb.so"
    "libssl.so"
    "mariadb-connector-c"
    "r>=2.8.0"
    "r-bit64"
    "r-blob"
    "r-dbi>=1.1.3"
    "r-hms>=0.5.0"
    "r-lubridate"
    "r-plogr"
    "r-cpp11"
    "r-rlang"
)
optdepends=(
    "r-dbitest>=1.7.2.9001"
    "r-decor"
    "r-readr"
    "r-rprojroot"
    "r-withr"
)

# The unittests for `r-rmariadb` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-rmariadb`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("32abe9160950e9a46ec17b2d0de29c0c7a689612dbaa275ea02e519291c0ada4e5d9c6c6ffbb7eb6f48a9c0facbcc67b80f285bf4dd35156882fdb206f1db731")

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
