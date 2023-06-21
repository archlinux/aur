# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=pkgcache
_cranver=2.1.1
pkgname=r-${_cranname,,}
pkgdesc="Cache ‘CRAN’-Like Metadata and R Packages"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("i686" "x86_64")
depends=(
    "r>=3.4"
    "r-callr>=2.0.4.9000"
    "r-cli>=3.2.0"
    "r-curl>=3.2"
    "r-filelock"
    "r-jsonlite"
    "r-prettyunits"
    "r-processx>=3.3.0.9001"
    "r-r6"
    "r-rappdirs"
)
optdepends=(
    "r-covr"
    "r-debugme"
    "r-desc"
    "r-fs"
    "r-mockery"
    "r-pillar"
    "r-pingr"
    "r-rprojroot"
    "r-sessioninfo"
    "r-spelling"
    "r-webfakes>=1.1.5"
    "r-withr"
    "r-zip"
)

# The unittests for `r-pkgcache` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-pkgcache`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat>=3.0.0"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("b024ab6731acb4fc425f35813fcc3fd7a05cb3010609f575113d7686591c7a06a7b6efaa56513b62cef15c66dc102aab12cf5fb0d93cf32bf25add3666cc7618")

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
