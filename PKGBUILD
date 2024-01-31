# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=rJava
_cranver=1.0-11
pkgname=r-${_cranname,,}
pkgdesc="Low-Level R to Java Interface"
url="https://cran.r-project.org/package=rJava"
license=("LGPL")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=("r" "java-environment<20")
optdepends=()
makedepends=()

source=(
    "https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
    "capture-javareconf-variables.sh"
)
b2sums=(
    "13ecb4a3c545505f047474027d586e0bf7ca02676bbe0bcd142bba786b3380714937f71efa2ca324fcf6efa0c20112f9ef8bc01d8093d3eea17e63176048d6b4"
    "ff9a162de319674b6d00e22b5244f06e58b395b955b697f78368c7b4f777dc9c073a4f46c74a071ca0943089fd93cd03f4aa9679f654b47259f485d166053196"
)
install="${pkgname}.install"

prepare() {
    export JAVA_HOME=/usr/lib/jvm/default
    R CMD javareconf -e "/bin/bash ./capture-javareconf-variables.sh"
}

build() {
    source r-javaconf.env
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/" --no-test-load
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
