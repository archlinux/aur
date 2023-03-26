# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=decor
_cranver=1.0.1
pkgname=r-${_cranname,,}
pkgdesc="Retrieve Code Decorations"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("i686" "x86_64")
depends=(
    "r>=3.3.0"
    "r-tibble"
    "r-vctrs"
)
optdepends=(
    "r-covr"
)

checkdepends=(
    "${optdepends[@]}"
    "r-testthat"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("52e4f122fc2c93bcded0f19c290a005a1d907c5560d710bb81023df66a14678a17b8b3514fbaccc535049cd947cafb0bd8a78c0f05a43c9e9621eff630b8bd5a")

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
