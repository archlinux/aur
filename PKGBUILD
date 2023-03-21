# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=futile.logger
_cranver=1.4.3
pkgname=r-${_cranname,,}
pkgdesc="A Logging Utility for R"
url="https://cran.r-project.org/package=${_cranname}"
license=("LGPL3")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("any")
depends=(
    "r-futile.options"
    "r-lambda.r>=1.1.0"
    "r>=3.0.0"
)
optdepends=(
    "r-jsonlite"
    "r-testthat"
)
checkdepends=(
    "${optdepends[@]}"
    "r-testthat"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('417b67e46adf74ae9bb9ed0093a325863ceaf3cbe68d2bc0171876be29c436286b0e7554520d8e588d46b83660a6a66bc838ccbd52ca44d3d2f155b7f3966134')

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
