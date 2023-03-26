# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=geojsonsf
_cranver=2.0.3
pkgname=r-${_cranname,,}
pkgdesc="GeoJSON to Simple Feature Converter"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("i686" "x86_64")
depends=(
    "r>=3.3.0"
    "r-geometries"
    "r-jsonify>=1.1.1"
    "r-rapidjsonr>=1.2.0"
    "r-rcpp"
    "r-sfheaders>=0.2.2"
)
optdepends=(
    "r-covr"
    "r-jsonify"
    "r-knitr"
    "r-rmarkdown"
)

# The unittests for `r-geojsonsf` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-geojsonsf`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-rcmdcheck"
#     "r-tinytest"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("7dd4803ea5c22f76425a67301ccb017aced79adf970c40463ec24aac5f3d898a23a5554a10fc231e3ee576ccc34e45c9b426f03142c0d6bcf70c3cb9e59e8b9b")

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
