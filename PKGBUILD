# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=brotli
_cranver=1.3.0
pkgname=r-${_cranname,,}
pkgdesc="A Compression Format Optimized for the Web"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

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

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("deba182069fe41fd14fac53ef6ebc52abc7e7845aaa8d740416d48ac573b43877d386d5810a9c593d3031ab6d5b6ca760752b8f5a299163e56db5e40c462e42e")

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

    cp -a --no-preserve=ownership \
        "${srcdir}/build/${_cranname}" \
        "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 \
            "${_cranname}/LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
