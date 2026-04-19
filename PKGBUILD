# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: peippo <christoph+aur@christophfink.com>

_cranname=geojsonsf
_cranver=2.0.5
pkgname=r-${_cranname,,}
pkgdesc="GeoJSON to Simple Feature Converter"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

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

source=(
    "https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
    "fix-rvalue-ref.patch"
)
b2sums=(
    "25b31673a1d0df7ba38edf027f67c96b8aa186568ae3a600a4396a697c63f1cd90680aa2026f2b6f154a34d51ca49379a9c46fbcc1f7a22da8e5dbddc6915233"
    "SKIP"
)

prepare() {
    cd "${srcdir}"
    tar -xzf ${_cranname}_${_cranver}.tar.gz
    patch -p1 -d "${_cranname}" < fix-rvalue-ref.patch
    tar -czf ${_cranname}_${_cranver}.tar.gz ${_cranname}
}

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
