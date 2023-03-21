# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=jdx
_cranver=0.1.4
pkgname=r-${_cranname,,}
pkgdesc="‘Java’ Data Exchange for ‘R’ and ‘rJava’"
url="https://cran.r-project.org/package=jdx"
license=("GPL2" "BSD")
pkgver=${_cranver//[:-]/.}
pkgrel=3

arch=("any")
depends=(
    "jdk11-openjdk"
    "r"
    "r-rjava"
)
optdepends=(
    "r-knitr"
    "r-pander"
    "r-rmarkdown"
)
checkdepends=(
    "${optdepends[@]}"
    "r-testthat>=3.0.0"
)

# source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
source=("https://cran.r-project.org/src/contrib/Archive/${_cranname}/${_cranname}_${_cranver}.tar.gz")
b2sums=("f49d89823da03762cc88711bbfe613cdbfc332c7910e9926bbf95a4fd3dd82ea54c99bf696c11e4b020a7adc5a274dfbc2d7672e5aa13d1d6f000c2db3f33720")

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
