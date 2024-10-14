# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=gtfsio
_cranver=1.2.0
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

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("c69b1db5bf37fe493c53673292a63328f662bbc85e74188f685512b42fe7e596fbe170f460c42a012db423cba77bf83041a5a31b75eb5a235bd9d1d3d0655365")

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
