# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=gtfsio
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgdesc="Read and Write General Transit Feed Specification (GTFS) Files"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=5

arch=("any")
depends=(
    "r"
    "r-data.table"
    "r-fs"
    "r-jsonlite"
    "r-zip"
)
optdepends=(
    "r-knitr"
    "r-rmarkdown"
)

checkdepends=(
    "${optdepends[@]}"
    "r-rcmdcheck"
    "r-tinytest"
)

source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('3892516704a7e854989a12d1bea691e4fe4c813a47b4e33c37e48d96b000cdc8bd6882d54bd9749a67728dea062714493a52089513110a53b24daadad0053f01')

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}/build/"
}

check() {
    export R_LIBS="build/"
    R CMD check --no-manual "${_pkgname}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_pkgname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${_pkgname}/LICENSE" ]]; then
        install -Dm0644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
