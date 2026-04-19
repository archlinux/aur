# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=geojsonsf
_pkgver=2.0.5
pkgname=r-${_pkgname,,}
pkgdesc="GeoJSON to Simple Feature Converter"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
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

source=(
    "https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
    "fix-rvalue-ref.patch"
)
b2sums=('25b31673a1d0df7ba38edf027f67c96b8aa186568ae3a600a4396a697c63f1cd90680aa2026f2b6f154a34d51ca49379a9c46fbcc1f7a22da8e5dbddc6915233'
        'c2886074fda8274e8eb34ec82e4f81e92c43f7d275c67b1c6da85fcfaf2fe3f2fcf3820dd66e447029f08fbd63a7f56d4b7e69c856cfad285c517ac9ed2edd2c')

prepare() {
    cd "${srcdir}"
    tar -xzf ${_pkgname}_${_pkgver}.tar.gz
    patch -p1 -d "${_pkgname}" < fix-rvalue-ref.patch
    tar -czf ${_pkgname}_${_pkgver}.tar.gz ${_pkgname}
}

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}/build/"
}

# check() {
#     export R_LIBS="build/"
#     R CMD check --no-manual "${_pkgname}"
# }

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_pkgname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${_pkgname}/LICENSE" ]]; then
        install -Dm0644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
