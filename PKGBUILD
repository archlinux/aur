# Maintainer: peippo <christoph+aur@christophfink.com>
# Maintainer: Grey Christoforo <first name at last name dot net>

_cranname=BiocManager
_cranver=1.30.24
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A convenient tool to install and update Bioconductor packages."
arch=("i686" "x86_64")
url="https://CRAN.R-project.org/package=${_cranname}"
license=("Artistic-2.0")
depends=(
    r
)
optdepends=(
    r-biocversion
    r-biocstyle
    r-curl
    r-knitr
    r-remotes
    r-rmarkdown
    r-withr
)

# The unittests for `r-biocmanager` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-biocmanager`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat>=3.0.0"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("9813f4bf8e354343f792d162b4d10cd4e89c80016eac2ba729de785683ba577b87da3a212111b809d2244be167048788dacaf3882cc81bce8ee548b17ece83eb")

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
