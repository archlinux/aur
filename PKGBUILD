# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=webfakes
_cranver=1.1.7
pkgname=r-${_cranname,,}
pkgdesc="Fake Web Apps for HTTP Testing"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r>=3.5.0"
)
optdepends=(
    "r-callr"
    "r-covr"
    "r-curl"
    "r-glue"
    "r-httpuv"
    "r-httr"
    "r-jsonlite"
    "r-testthat>=3.0.0"
    "r-withr"
    "r-xml2"
)
checkdepends=(
    "${optdepends[@]}"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('ce1fbe037f8417308e3c7347ec3c67a84a428fa26a00c8053ae5c0ae1a164cb7c358e366214032c9ca77403b0636d8acd283d58f07c8debf8cc05af05147dce4')

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
