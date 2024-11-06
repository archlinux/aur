# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=S7
_cranver=0.1.1
pkgname=r-${_cranname,,}
pkgdesc="An Object Oriented System Meant to Become a Successor to S3 and S4"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r"
)
optdepends=(
    "r-bench"
    "r-covr"
    "r-knitr"
    "r-rmarkdown"
    "r-tibble"
)

checkdepends=(
    "${optdepends[@]}"
    "r-testthat"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('b6c7a2bf9542767f63258eae33d2e19656e65a5bb620d00e937daf8d762eb6db85f2c28e40383e7996df310993b9e6ce99eca4426c2b884b667be973f35fb2c3')

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
