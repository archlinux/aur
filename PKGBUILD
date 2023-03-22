# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=parsedate
_cranver=1.3.1
pkgname=r-${_cranname,,}
pkgdesc="Recognize and Parse Dates in Various Formats"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL2")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r"
)
optdepends=(
    "r-covr"
    "r-withr"
)
checkdepends=(
    "${optdepends[@]}"
    "r-testthat"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("61cce210fc9232d364aa72d78911af243cf9ea452f7c96e41a612b4dceef5b03929a3711c8cc0b51395aabd46d24cd652922a2938250db67a741b8d669104289")

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
