# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=gtfsio
_cranver=1.1.1
pkgname=r-${_cranname,,}
pkgdesc="Read and Write General Transit Feed Specification (GTFS) Files"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("any")
depends=(
    "r"
    "r-data.table"
    "r-zip"
)
optdepends=(
    "r-knitr"
    "r-rmarkdown"
)

checkdepends=(
    "${optdepends[@]}"
    "r-rcmdcheck"
    "r-tinytest"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("60030a53a238da8187ae7f3914ba4f7350e615e949b0ce51c20d4546a5c26aa7d7fd2678ee000f4a665b6e48a65e96f13071ae65dd7fb8d63294519784f37776")

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
