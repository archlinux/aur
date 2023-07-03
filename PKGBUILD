# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=odbc
_cranver=1.3.5
pkgname=r-${_cranname,,}
pkgdesc="Connect to ODBC Compatible Databases (using the DBI Interface)"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r>=3.2.0"
    "r-bit64"
    "r-blob>=1.2.0"
    "r-dbi>=1.1.0"
    "r-hms"
    "r-rcpp>=0.12.11"
    "r-rlang>=0.2.0"
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
b2sums=('b23e16cf0d2a2a35f41e1844589e1e5c344a0e667d368d67d67990c4b0361e1630bd7031df3401c66c47367d46c28807486aadce7237301844b305ab670d0df3')

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
