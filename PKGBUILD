# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=pak
_cranver=0.7.0
pkgname=r-${_cranname,,}
pkgdesc="Another Approach to R Package Installation"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL3")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r>=3.5"
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
    "r-pkgbuild>=1.4.1"
    "r-pkgcache>=2.0.4"
    "r-pkgdepends>=0.5.0.9001"
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
b2sums=("2aed95f3b4eefca416a2248a168c7455a08b84436b004c78dbbcd667aea80882d2e1f203fbcbc8734013f4ba9aa86b911df87f3656b940538e814640d825cb06")

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
