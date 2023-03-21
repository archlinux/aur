# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=whoami
_cranver=1.3.0
pkgname=r-${_cranname,,}
pkgdesc="Username, Full Name, Email Address, 'GitHub' Username of the Current
User"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r"
    "r-httr"
    "r-jsonlite"
)
optdepends=(
    "r-covr"
    "r-mockery"
    "r-withr"
)
checkdepends=(
    "${optdepends[@]}"
    "r-testthat"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("e9c1b67039a52387bc5c8a2e394b45f8283a4aa0f93b11483ff7e99d740366df7269d11a0930f4107d51cf12959e039de577e1012bd58d58c629bd7972cbb08c")

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
