# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=webfakes
_cranver=1.1.7
pkgname=r-${_cranname,,}
pkgdesc="Fake Web Apps for HTTP Testing"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("i686" "x86_64")
depends=(
    "r>=3.5.0"
)
optdepends=(
    "r-callr"
    "r-covr"
    "r-curl"
    "r-glue"
    "r-httpuv"
    "r-httr"
    "r-jsonlite"
    "r-withr"
    "r-xml2"
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
b2sums=("ce1fbe037f8417308e3c7347ec3c67a84a428fa26a00c8053ae5c0ae1a164cb7c358e366214032c9ca77403b0636d8acd283d58f07c8debf8cc05af05147dce4")

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
