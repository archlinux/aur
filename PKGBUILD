# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=terra
_cranver=1.7-71
pkgname=r-${_cranname,,}
pkgdesc="Spatial Data Analysis"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL3")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "gdal>=2.2.3"
    "geos>=3.4.0"
    "proj>=4.9.3"
    "r-rcpp>=1.0.10"
    "r>=3.5.0"
    "sqlite"
)
optdepends=(
    "r-deldir"
    "r-htmlwidgets"
    "r-leaflet>=2.2.1"
    "r-ncdf4"
    "r-sf>=0.9.8"
    "r-tinytest"
    "r-xml"
)

# The unittests for `r-terra` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-terra`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-rcmdcheck"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("f6c96953c0eef18e502e48210aa1b98a47bd38a86aa0f7c9f176a01ff12a380e88d2f023bee060d8762a78bddd71329b636267b7c3a247cf7ffaa4b0d7471807")

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
