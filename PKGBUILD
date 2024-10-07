# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=jose
_cranver=1.2.1
pkgname=r-${_cranname,,}
pkgdesc="JavaScript Object Signing and Encryption"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r"
    "r-jsonlite"
    "r-openssl>=1.2.1"
)
optdepends=(
    "r-knitr"
    "r-rmarkdown"
    "r-spelling"
)

# The unittests for `r-jose` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-jose`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("9bb1ff4b18deb77dace6a79f0b0c5e1ba73817d1b4f5b39a5f01b928a2f67e91ca8f5202a04c80ef9451186398155085db954d7d2fb17d0978ffa1da5f5dd77c")

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
