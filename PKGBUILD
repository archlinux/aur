# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=pkgcache
_cranver=2.0.4
pkgname=r-${_cranname,,}
pkgdesc="Cache ‘CRAN’-Like Metadata and R Packages"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r>=3.4"
    "r-callr>=2.0.4.9000"
    "r-cli>=3.2.0"
    "r-curl>=3.2"
    "r-filelock"
    "r-jsonlite"
    "r-prettyunits"
    "r-processx>=3.3.0.9001"
    "r-r6"
    "r-rappdirs"
)
optdepends=(
    "r-covr"
    "r-debugme"
    "r-desc"
    "r-fs"
    "r-mockery"
    "r-pillar"
    "r-pingr"
    "r-rprojroot"
    "r-sessioninfo"
    "r-spelling"
    "r-webfakes>=1.1.5"
    "r-withr"
    "r-zip"
)
checkdepends=(
    "${optdepends[@]}"
    "r-testthat>=3.0.0"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("64a5a6e060737d3d796c5f2b5060e67770db2ffc5f0644e0881e8876a638f779d749a850636d1210b1fdde5eaf306d528185dbf7ee91cacdba50a0b6ce29c6c8")

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
