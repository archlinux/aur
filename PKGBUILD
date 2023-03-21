# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=leaflet.providers
_cranver=1.9.0
pkgname=r-${_cranname,,}
pkgdesc="Third-party map tiles for r-leaflet"
url="https://cran.r-project.org/package=${_cranname}"
license=("BSD")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("any")
depends=(
    "r>=2.10"
)
optdepends=(
    "r-jsonlite"
    "r-v8"
)
checkdepends=(
    "${optdepends[@]}"
    "r-testthat>=2.1.0"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('68ecb534f944b1c1848b3533cd17c10091c654fad099f46961cf437d61940dac50e7cf19395e08a1d0bde3d093ab17eafc8fba03a1a01ae0b192ae9a801b2bb3')

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
