# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=cli
_cranver=3.6.2
pkgname=r-${_cranname,,}
pkgdesc="Helpers for Developing Command Line Interfaces"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r>=3.4"
)
optdepends=(
    "r-callr"
    "r-covr"
    "r-crayon"
    "r-digest"
    "r-glue>=1.6.0"
    "r-htmltools"
    "r-htmlwidgets"
    "r-knitr"
    "r-mockery"
    "r-processx"
    "r-ps>=1.3.4.9000"
    "r-rlang>=1.0.2.9003"
    "r-rmarkdown"
    "r-rprojroot"
    "r-rstudioapi"
    "r-tibble"
    "r-whoami"
    "r-withr"
)

# The unittests for `r-cli` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-cli`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("5e297757ffecbe6b9b8f62096fa9a58a9c301ad5ace99cd82cb7e7f9c11719b4963cc35441d5104d5e1e772cecbc275756f11f0372770c4beeccb32a3c67219d")

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
