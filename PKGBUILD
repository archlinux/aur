# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=brotli
_pkgver=1.3.2
pkgname=r-${_pkgname,,}
pkgdesc="A Compression Format Optimized for the Web"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=2

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
b2sums=('e4a14de978e10657db8ddc050bd9907840474c2b24968a21b64cea95084f68ed76d556ae9bf25073966105a1107eab1ec126eff96ac6752f8b6bf758aab0bb8e')

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
