# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=openssl
_cranver=2.0.5
pkgname=r-${_cranname,,}
pkgdesc="Encryption, Signatures and Certificates Based on OpenSSLi"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r"
    "r-askpass"
    "openssl"
)
optdepends=(
    "r-curl"
    "r-digest"
    "r-jose"
    "r-jsonlite"
    "r-knitr"
    "r-rmarkdown"
    "r-sodium"
)
makedepends=()
checkdepends=(
    "r-jose"
    "r-sodium"
    "r-testthat>=2.1.0",
    "r-usethis"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("d8612c058c2b52fe39dd0dc26e860e732c6506502aac20427f9fafb0304e63006f15a35d6be16208b710e74d04d909387f753b67043e9df4dc0948182c4a4ff9")

build() {
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

check() {
    echo "library(usethis); usethis::use_testthat(3)" | R CMD BATCH
    R CMD check
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
