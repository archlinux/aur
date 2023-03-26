# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=pak
_cranver=0.4.0
pkgname=r-${_cranname,,}
pkgdesc="Another Approach to R Package Installation"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL3")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("any")
depends=(
    "r>=3.2"
)
optdepends=(
    "r-callr>=3.7.0"
    "r-cli>=3.2.0"
    "r-covr"
    "r-curl>=4.3.2"
    "r-desc>=1.4.1"
    "r-digest"
    "r-distro"
    "r-filelock>=1.0.2"
    "r-gitcreds"
    "r-glue>=1.6.2"
    "r-jsonlite>=1.8.0"
    "r-mockery"
    "r-pingr"
    "r-pkgcache>=2.0.4"
    "r-pkgdepends>=0.4.0"
    "r-pkgsearch>=3.1.0"
    "r-prettyunits"
    "r-processx>=3.5.2"
    "r-ps>=1.6.0"
    "r-rprojroot>=2.0.2"
    "r-rstudioapi"
    "r-withr"
)

# "${optdepends[@]}" except r-pkgdepends (circular dependency chain)
# The unittests for `r-pak` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-pak`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("19d22327bea7f7395e1de8d230514e0e4174ccb60544df0a0a168a368a9448a65b56f1c33eac1dd0087a9ea7cdaa9469da1ac2cd3dd7184fb07569db68f0649b")

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
