# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=jdx
_cranver=0.1.4
pkgname=r-${_cranname,,}
pkgdesc="‘Java’ Data Exchange for ‘R’ and ‘rJava’"
url="https://cran.r-project.org/package=jdx"
license=("GPL2" "BSD")
pkgver=${_cranver//[:-]/.}
pkgrel=4

arch=("any")
depends=(
    "jdk11-openjdk"
    "r"
    "r-rjava"
)
optdepends=(
    "r-knitr"
    "r-pander"
    "r-rmarkdown"
)

# The unittests for `r-jdx` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-jdx`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat>=3.0.0"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("f49d89823da03762cc88711bbfe613cdbfc332c7910e9926bbf95a4fd3dd82ea54c99bf696c11e4b020a7adc5a274dfbc2d7672e5aa13d1d6f000c2db3f33720")

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
