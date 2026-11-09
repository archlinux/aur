# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=brotli
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgdesc="A Compression Format Optimized for the Web"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=4

arch=("i686" "x86_64")
depends=(
    "r"
)
makedepends=()
optdepends=(
    "r-spelling"
    "r-knitr"
    "r-r.rsp"
    "r-microbenchmark"
    "r-rmarkdown"
    "r-ggplot2"
)
checkdepends=(
    "${optdepends[@]}"
)

source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('0fb2d6173733ab48914edf3339164884b858e6888c1985f7b984f123e9094f5d02ca3b2e8204404fe36d584bb98e0f3b9f1d7a9a710062de3e58b8855ead7dd5')

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}/build/"
}

check() {
    export R_LIBS="build/"
    R CMD check --no-manual "${_pkgname}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"

    cp -a --no-preserve=ownership \
        "${srcdir}/build/${_pkgname}" \
        "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_pkgname}/LICENSE" ]]; then
        install -Dm0644 \
            "${_pkgname}/LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
