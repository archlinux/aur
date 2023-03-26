# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=gtfstools
_cranver=1.2.0
pkgname=r-${_cranname,,}
pkgdesc="Read, manipulate, analyse and write transit feeds in the General
Transit Feed Specification (GTFS) data format"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("i686" "x86_64")
depends=(
    "r>=2.10"
    "r-checkmate"
    "r-cpp11"
    "r-curl"
    "r-data.table"
    "r-gtfsio>=1.0.0"
    "r-processx"
    "r-sf"
    "r-sfheaders"
    "r-units"
    "r-zip"
)
optdepends=(
    "r-covr"
    "r-ggplot2"
    "r-jsonlite"
    "r-knitr"
    "r-rmarkdown"
)

# The unittests for `r-gtfstools` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-gtfstools`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("daacc3945c0127277f42fd1bd48ad7914447b2a78871af0e1d22f8a4c6bd68d577bd4c6dd3767a28553f53ed3b4c72a7c025f9abf2d8dda45403404f64e79050")

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

# check() {
#     export R_LIBS="build/"
#     R CMD check --no-manual "${_cranname}"
# }

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
