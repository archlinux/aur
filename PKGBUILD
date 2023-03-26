# Maintainer: peippo <christoph+aur@christophfink.com>
# Maintainer: Grey Christoforo <first name at last name dot net>

_cranname=BiocManager
_cranver=1.30.20
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=3
pkgdesc="A convenient tool to install and update Bioconductor packages."
arch=("i686" "x86_64")
url="https://CRAN.R-project.org/package=${_cranname}"
license=("Artistic2.0")
depends=(
    r
)
optdepends=(
    r-biocversion
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
b2sums=("f70c66f07d361d80f2679af273b9b948cf492ab5ef138dc552b264c462e30c602a3324bda346b181663e2e9f492e432ea48d7e995e311e51dfd98e3519e4a03c")

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
