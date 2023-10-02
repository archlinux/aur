# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=webfakes
_cranver=1.2.1
pkgname=r-${_cranname,,}
pkgdesc="Fake Web Apps for HTTP Testing"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r>=3.5.0"
)
optdepends=(
    "r-brotli"
    "r-callr"
    "r-covr"
    "r-curl"
    "r-digest"
    "r-glue"
    "r-httpuv"
    "r-httr"
    "r-jsonlite"
    "r-withr"
    "r-xml2"
    "r-zip>=2.3.0"
)

# The unittests for `r-webfakes` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-webfakes`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

checkdepends=(
    "${optdepends[@]}"
    "r-testthat>=3.0.0"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("5843bd323cf2ec9a873682d8cb3cdfa29fe47ff69c85c584ea5ad0c09c8e3c11e5fedc2ff50465cda708e92c05b585d87cd30e6330e2a94ad45c00c9eb92aa33")

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

check() {
    export R_LIBS="build/"
    R CMD check --no-manual "${_cranname}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
