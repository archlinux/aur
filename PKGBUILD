# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=RMariaDB
_cranver=1.3.3
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

checkdepends=(
    "${optdepends[@]}"
    "r-testthat"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("97a79a9d104d3600801415b2b7c74065282f6a58235ac625a2336fa6e69f591961d1dffd0f4289b26d9c83501c0d1f993931e322a3997995b43ed75da55afc73")

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
