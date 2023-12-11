# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=pkgsearch
_cranver=3.1.3
pkgname=r-${_cranname,,}
pkgdesc="Search and Query CRAN R Packages"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r"
    "r-curl"
    "r-jsonlite"
)
optdepends=(
    "r-covr"
    "r-memoise"
    "r-mockery"
    "r-pillar"
    "r-pingr>=2.0.0"
    "r-rstudioapi"
    "r-shiny"
    "r-shinyjs"
    "r-shinywidgets"
    "r-whoami"
    "r-withr"
)

# The unittests for `r-pkgsearch` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-pkgsearch`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat>=3.0..0"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("2021907562f44165304dbb762b6561e58d935f2d7c2822cec12545bf169a4379d49a76006aa65a64e2f164cadafb8120c9712813b8068b9f6c6a6de0fe9eaa6c")

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
