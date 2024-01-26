# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=odbc
_cranver=1.4.2
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
    "r-dbi>=1.1.0"
    "r-hms"
    "r-lifecycle"
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
b2sums=("98d66e38d316637ad15014dc0af29ee8e7efe1d400e30fd699f8917c7d4a731f04c32594b737f2098f6b672a0b3ff218c69a23985804d09003cc73272c0be120")

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
