# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=leaflet.providers
_pkgver=3.0.0
pkgname=r-${_pkgname,,}
pkgdesc="Third-party map tiles for r-leaflet"
url="https://cran.r-project.org/package=${_pkgname}"
license=("BSD")
pkgver=${_pkgver//-/.}
pkgrel=2

arch=("any")
depends=(
    "r>=2.10"
    "r-htmltools"
)
optdepends=(
    "r-jsonlite"
    "r-v8"
)

# The unittests for `r-leaflet.providers` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-leaflet.providers`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat>=3.0.0"
# )

source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('5801697aab5ccaa7909909b21df832d7f36a58ac094d2de5e3237bc64cc466aba10aa1f165c03805d7248f2012100e4beafff8c6264e2ff4be1e0fe15a0bbcbc')

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
