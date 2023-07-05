# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Jooa <aur at (name) dot xyz>

_cranname=raster
_cranver=3.6-23
pkgname=r-${_cranname,,}
pkgdesc="Geographic Data Analysis and Modeling"
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=(i686 x86_64)
depends=(
    "r-rcpp"
    "r-sp>=1.4.5"
    "r-terra>=1.7.29"
    "r>=3.5.0"
)
optdepends=(
    "r-exactextractr"
    "r-fields"
    "r-gstat"
    "r-igraph"
    "r-mass"
    "r-ncdf4"
    "r-rastervis"
    "r-sf"
)
# The unittests for `r-raster` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-raster`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

checkdepends=(
    "${optdepends[@]}"
    "r-tinytest"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("5261faa2a57e9d7f0ba8ca3a5c0ce1e1135818e5ab457a42c97347f87de7e646ac1119e0f12b350038568af9fef57673af446d9a916456d26081aafbf9636c3f")

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

check() {
    export R_LIBS="build/"
    R CMD check --no-manual "${_cranname}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
