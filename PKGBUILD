# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=webfakes
_cranver=1.3.0
pkgname=r-${_cranname,,}
pkgdesc="Fake Web Apps for HTTP Testing"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("i686" "x86_64")
depends=(
    "r>=3.6"
)
optdepends=(
    "r-brotli"
    "r-callr"
    "r-covr"
    "r-curl"
    "r-digest"
    "r-glue"
    "r-httpuv"
    "r-httr"
    "r-jsonlite"
    "r-processx"
    "r-withr"
    "r-xml2"
    "r-zip>=2.3.0"
)

# The unittests for `r-webfakes` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-webfakes`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat>=3.0.0"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("a356ea5e963643b4b1fa63a950a09736af6f5c6337b8c2b9672ea33439fe9f32e940e7c71427560060682dbd316a6c1dda814ed5f79938d96b3ba01825e7104b")

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
