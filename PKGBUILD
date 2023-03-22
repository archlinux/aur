# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=anytime
_cranver=0.3.9
pkgname=r-${_cranname,,}
pkgdesc="Anything to ‘POSIXct’ or ‘Date’ Converter"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r>=3.2.0"
    "r-bh"
    "r-rcpp>=0.12.9"
)
optdepends=(
    "r-gettz"
)
checkdepends=(
    "${optdepends[@]}"
    "texlive-core"
    "r-tinytest"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("867cca7faadc29cb99e4ae8428eabd0e3fa00e1c1f0553d3a0d8275c5526743a11dff340b1cacac3ae03bc294f2c9968110234d55e99a6ebc43c7bf413c0b58f")

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

check() {
    R_LIBS="build/" R CMD check --no-manual --as-cran "${_cranname}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
