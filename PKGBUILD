# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=jose
_cranver=1.2.0
pkgname=r-${_cranname,,}
pkgdesc="JavaScript Object Signing and Encryption"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("any")
depends=(
    "r"
    "r-jsonlite"
    "r-openssl>=1.2.1"
)
optdepends=(
    "r-knitr"
    "r-rmarkdown"
    "r-spelling"
)
checkdepends=(
    "r-testthat"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("105c77d909cb56075721008566372306e934a8bb788e83d34cf3966534d54ae9632d4a8c286151313fe46925c13e8d454c586d6d0a58c2580e2e912c3c2ed886")

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
