# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=asciicast
_cranver=2.3.1
pkgname=r-${_cranname,,}
pkgdesc="Create ‘Ascii’ Screen Casts from R Scripts"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=2

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
    "r-testthat>=3.2.0"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("15827cc88d3e715fb0600d257df06834b4d813c56cc43517252784b007e5ee2734f321fe98386ef8287237703fb6c3e27ff4234804bbe7b67651d02bbc779859")

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
