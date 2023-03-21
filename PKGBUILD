# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=gtfsio
_cranver=1.1.0
pkgname=r-${_cranname,,}
pkgdesc="Read and Write General Transit Feed Specification (GTFS) Files"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r"
    "r-data.table"
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

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('43ed6035bcb68b1d42fab7eb6bf90f91dcb24317feca07d5a3b0c34d955ded7c0e14941288e92fb925ab16be8816a291dd471706ee09223d5ccb8ee32ecdfd60')

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

check() {
    cd "${srcdir}/${_cranname}/"
    R_LIBS="${srcdir}/build/" R CMD check --no-manual .
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
