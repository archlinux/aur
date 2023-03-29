# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=odbc
_cranver=1.3.4
pkgname=r-${_cranname,,}
pkgdesc="Connect to ODBC Compatible Databases (using the DBI Interface)"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r-bit64"
    "r-blob>=1.2.0"
    "r-dbi>=1.1.0"
    "r-hms>=1.1.0"
    "r-lubridate"
    "r-rcpp>=0.12.11"
    "r-rlang>=0.2.0"
    "r>=3.2.0"
    "unixodbc"
)
makedepends=(
    "r-cpp11"
)
optdepends=(
    "r-covr"
    "r-dbitest"
    "r-magrittr"
    "r-rsqlite"
    "r-tibble"
)
checkdepends=(
    "${optdepends[@]}"
    "r-testthat"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("e076ad28813755c5fda4d6c78ad70d8adf1953899b623cea1f5d57d5726d7e125a813a240230f098101c63b2478872d1fbde348e51f87c52ef23a1fccb42410e")

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

check() {
    export R_LIBS="build/"
    R CMD check --no-manual "${_cranname}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
