# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=r5r
_cranver=0.6.0
pkgname=r-${_cranname,,}
pkgdesc="Rapid Realistic Routing with 'R5'"
url="https://cran.r-project.org/package=r5r"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=("java-r5" "java-r5rcore" "r" "r-checkmate" "r-curl" "r-data.table" "r-httr" "r-raster" "r-rjava" "r-sf" "r-sfheaders")
optdepends=("r-akima" "r-covr" "r-dplyr" "r-ggplot2" "r-knitr" "r-mapview" "r-rmarkdown" "r-rgdal" "r-testthat")
makedepends=()

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=("8b766bc98ef6e9caa85c0e7e7b922c26ac4b63a9eba24313078cd9b46293cad761dff0883e69e79f02f7b01fd901ea75d63a01edb4c1df2741e5bff6ac316ee8")

build() {
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"

    ln -sf \
        /usr/share/java/java-r5rcore/java-r5rcore.jar \
        "${pkgdir}/usr/lib/R/library/${_cranname}/jar/${_cranname}_${pkgver//./_}.jar"

    ln -sf \
        /usr/share/java/r5/r5-all.jar \
        "${pkgdir}/usr/lib/R/library/${_cranname}/jar/r5-v6.4-all_20210820.jar"

        # TODO: don’t hardcode these paths!

        # ( this is going to be a bit of a pita:
        #       1. get https://www.ipea.gov.br/geobr/r5r/metadata.csv
        #       2. check in ${srcdir}/.../download_r5.R what the default argument for `version` is
        #       3. find the basename of the according url from the csv
        # tl;dr: not pretty in a PKGBUILD)

    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
