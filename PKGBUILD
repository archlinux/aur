# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=pkgdepends
_cranver=0.4.0
pkgname=r-${_cranname,,}
pkgdesc="Cache ‘CRAN’-Like Metadata and R Packages"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("i686" "x86_64")
depends=(
    "r>=3.4"
    "r-callr>=3.3.1"
    "r-cli>=3.4.0"
    "r-curl"
    "r-desc>=1.2.0"
    "r-filelock>=1.0.2"
    "r-glue"
    "r-lpsolve"
    "r-pkgbuild>=1.0.2"
    "r-pkgcache>=2.0.0"
    "r-prettyunits>=1.1.1"
    "r-processx>=3.4.2"
    "r-ps"
    "r-r6"
    "r-rprojroot"
    "r-withr"
    "r-zip"
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

# # "${optdepends[@]}" except r-pak (another circular dependency chain)
# checkdepends=(
#     "r-asciicast>=2.2.0.9000"
#     "r-covr"
#     "r-debugme"
#     "r-fansi"
#     "r-fs"
#     "r-htmlwidgets"
#     "r-mockery"
#     "r-pingr>=2.0.0"
#     "r-rmarkdown"
#     "r-rstudioapi"
#     "r-spelling"
#     "r-tibble"
#     "r-webfakes>=1.1.5.9000"
# 
#     "r-testthat"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("3bfd85c2b380906ba79e3185e886c118027f0788681d418aef28e498c55c831ea7a1b9b163b1c581835067c78f8a12abb76a0dda98a3f5a0da56eada7ec9b6ce")

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
