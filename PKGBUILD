# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: peippo <christoph+aur@christophfink.com>

_cranname=odbc
_cranver=1.6.4.1
pkgname=r-${_cranname,,}
pkgdesc="Connect to ODBC Compatible Databases (using the DBI Interface)"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r>=3.6.0"
    "r-bit64"
    "r-blob>=1.2.0"
    "r-cli"
    "r-dbi>=1.1.0"
    "r-hms"
    "r-lifecycle"
    "r-rcpp>=0.12.11"
    "r-rlang>=1.1.0"
    "unixodbc"
)
makedepends=(
    "r-cpp11"
)
optdepends=(
    "r-covr"
    "r-dbitest"
    "r-magrittr"
    "r-rmarkdown"
    "r-rsqlite"
    "r-tibble"
    "r-withr"
)
checkdepends=(
    "${optdepends[@]}"
    "r-testthat>=3.0.0"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("506d54eb7c7ef1e05b8f6f8137f76c507956e3a753aa3bce447c1a6b353b991454e711f7c3a354e397194b0600ef68fbdb3a5c29c9acdbd754da9bd8ebec6f31")

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
