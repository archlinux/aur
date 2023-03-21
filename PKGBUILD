# Maintainer: peippo <christoph+aur@christophfink.com>
# Maintainer: Alex Branham <branham@utexas.edu>

_cranname=debugme
_cranver=1.1.0
pkgname=r-${_cranname,,}
pkgdesc="Specify debug messages as special string constants, and control
debugging of packages via environment variables."
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("any")
depends=(
    "r"
    "r-crayon"
)
optdepends=(
    "r-covr"
    "r-mockery"
    "r-r6"
    "r-withr"
)
checkdepends=(
    "${optdepends[@]}"
    "r-testthat"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("5c52733e28d0728629183f2c66a53bcd5309fbb67750e4ee3cfefa58a92f02fd97bda2ca1c2c0ad8abc69be10b16c9d07b8c36818f92325ce9f1ee52ed8ae0c9")

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
