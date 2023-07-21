# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=pkgdepends
_cranver=0.6.0
pkgname=r-${_cranname,,}
pkgdesc="Cache ‘CRAN’-Like Metadata and R Packages"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r>=3.4"
    "r-callr>=3.3.1"
    "r-cli>=3.6.0"
    "r-curl"
    "r-desc>=1.2.0"
    "r-filelock>=1.0.2"
    "r-glue"
    "r-jsonlite"
    "r-lpsolve"
    "r-pkgbuild>=1.0.2"
    "r-pkgcache>=2.2.0"
    "r-prettyunits>=1.1.1"
    "r-processx>=3.4.2"
    "r-ps"
    "r-r6"
    "r-rprojroot"
    "r-zip>=2.3.0"
)
optdepends=(
    "r-asciicast>=2.2.0.9000"
    "r-covr"
    "r-debugme"
    "r-fansi"
    "r-fs"
    "r-htmlwidgets"
    "r-mockery"
    "r-pak"
    "r-pingr>=2.0.0"
    "r-rmarkdown"
    "r-rstudioapi"
    "r-spelling"
    "r-tibble"
    "r-webfakes>=1.1.5.9000"
    "r-withr>=2.1.1"
)

# The unittests for `r-pkgdepends` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-pkgdepends`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("d3772ceb1287b4472909e3ae5dcc02b10f43b39ceb32267c1e2d830cebab8c1c081e5b1938cd5e382ae220d41a7f0dcc5a2d770eefcaf221794c33e46cdcd75a")

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
