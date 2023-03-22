# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=asciicast
_cranver=2.3.0
pkgname=r-${_cranname,,}
pkgdesc="Create ‘Ascii’ Screen Casts from R Scripts"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r"
    "r-cli>=3.3.0.9000"
    "r-curl"
    "r-jsonlite"
    "r-magick>=2.2.9002"
    "r-processx>=3.7.0"
    "r-tibble"
    "r-v8"
    "r-withr"
)
optdepends=(
    "r-callr>=3.7.0"
    "r-covr"
    "r-cpp11"
    "r-decor"
    "r-htmlwidgets"
    "r-knitr"
    "r-mockery"
    "r-rmarkdown"
    "r-rstudioapi"
)
checkdepends=(
    "${optdepends[@]}"
    "r-testthat>=3.0.0"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("a8483ae9699f4b7235a1ba90e38597c7e71b7c230da6d72b2a77d561227b1f5475134f28cd1095099b5f5e4519c47797efbe4f6fad134a8be9b635b4b9e63dc8")

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
