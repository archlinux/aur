# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=lambda.r
_cranver=1.2.4
pkgname=r-${_cranname,,}
pkgdesc="Functions that Apply to Rows and Columns of Matrices (and to Vectors)"
url="https://cran.r-project.org/package=${_cranname}"
license=("LGPL3")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("any")
depends=(
    "r>=3.0.0"
    "r-formatr"
)
checkdepends=(
    "${optdepends[@]}"
    "r-rcmdcheck"
    "r-testit"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('be22af4d7c54a6dcdef4f745edffa5a84dd42abdd22683f250b0fb84075fe6b666720a759e6e01c2532dddcdb62ba9beb6767f8512895489f8f47d0df44368e5')

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

check() {
    cd "${srcdir}/${_cranname}/"
    R_LIBS="${srcdir}/build/" R CMD check --no-manual --as-cran .
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
