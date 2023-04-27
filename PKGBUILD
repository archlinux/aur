# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=pak
_cranver=0.5.1
pkgname=r-${_cranname,,}
pkgdesc="Another Approach to R Package Installation"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL3")
pkgver=${_cranver//[:-]/.}
pkgrel=1

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
    "r-processx>=3.8.1"
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
b2sums=("dc69422ea3d3b1612b5564ed8aee3f17f6f35f57c53055b47e3a307d07d63de19313955f1f0957796ad147cc05671a5f6c71e0a1a4b6085bee84188b81ecbf3f")

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
