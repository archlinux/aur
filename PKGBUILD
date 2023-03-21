# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=exactextractr
_cranver=0.9.1
pkgname=r-${_cranname,,}
pkgdesc="Fast Extraction from Raster Datasets using Polygons"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=6

arch=("i686" "x86_64")
depends=(
    "geos>=3.5.0"
    "r-raster"
    "r-rcpp>=0.12.12"
    "r-sf>=0.9.0"
    "r>=3.4.0"
)
optdepends=(
    "r-dplyr"
    "r-foreign"
    "r-knitr"
    "r-ncdf4"
    "r-rgdal"
    "r-rmarkdown"
    "r-terra>=1.5.17"
)
checkdepends=(
    "${optdepends[@]}"
    "r-testthat"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('24c157af9baf985149328519c770cbff3a2a1ba96584ad2e4ab4ed3820d90c7a466ef1bb654a3929054499327ead48c23c21a6d54ef1a1414d260a964680ac86')

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

check() {
    cd "${srcdir}/${_cranname}/tests"
    R_LIBS="${srcdir}/build/" Rscript --vanilla testthat.R
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
