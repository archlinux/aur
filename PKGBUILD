# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=gtfstools
_cranver=1.3.0
pkgname=r-${_cranname,,}
pkgdesc="Read, manipulate, analyse and write transit feeds in the General
Transit Feed Specification (GTFS) data format"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r>=2.10"
    "r-checkmate"
    "r-cli"
    "r-curl"
    "r-data.table"
    "r-gtfsio>=1.0.0"
    "r-parallelly"
    "r-processx"
    "r-sf"
    "r-sfheaders"
    "r-units"
    "r-zip"
)
optdepends=(
    "r-covr"
    "r-ggplot2"
    "r-jsonlite"
    "r-knitr"
    "r-rmarkdown"
)

checkdepends=(
    "${optdepends[@]}"
    "r-testthat>=3.0.0"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("0b509daa97b3c5ba0222f598e0451d07dc9aa546fd49f2359b03ebb22ec2f0da10272ecd2d0c37a2c13e231561d11fa9adb542b597b00684478729f72d1456b5")

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
