# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=h3jsr
_cranver=1.3.1
pkgname=r-${_cranname,,}
pkgdesc="Access Uber's H3 Library"
url="https://cran.r-project.org/package=${_cranname}"
license=("Apache")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("any")
depends=(
    "r>=2.10"
    "r-geojsonsf"
    "r-sf"
    "r-tidyr"
    "r-v8>=4.0.0"
)
optdepends=(
    "r-covr"
    "r-dplyr"
    "r-ggplot2"
    "r-knitr"
    "r-rmarkdown"
)

checkdepends=(
    "${optdepends[@]}"
    "r-testthat"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("1cfda04f0dc4dc183532f17630f39b57c9c6b40abb4795d4f0a92e67877439aff4916b11c0bc4fb72aa8784bef9da9f3085c3afb59202db1e62857a44d80758e")

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

check() {
    export R_LIBS="build/"
    R CMD check --no-manual --no-vignettes "${_cranname}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
