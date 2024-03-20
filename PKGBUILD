# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Matt Frichtl <frichtlm@gmail.com>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=dbplyr
_cranver=2.5.0
pkgname=r-${_cranname,,}
pkgdesc="A ‘dplyr’ Back End for Databases"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r>=3.6"
    "r-blob>=1.2.0"
    "r-cli>=3.6.1"
    "r-dbi>=1.1.3"
    "r-dplyr>=1.1.2"
    "r-glue>=1.6.2"
    "r-lifecycle>=1.0.3"
    "r-magrittr"
    "r-pillar>=1.9.0"
    "r-purrr>=1.0.1"
    "r-r6>=2.2.2"
    "r-rlang>=1.1.1"
    "r-tibble>=3.2.1"
    "r-tidyr>=1.3.0"
    "r-tidyselect>=1.2.1"
    "r-vctrs>=0.6.3"
    "r-withr>=2.5.0"
)
optdepends=(
    "r-bit64"
    "r-covr"
    "r-knitr"
    "r-lahman"
    "r-nycflights13"
    "r-odbc>=1.4.2"
    "r-rmariadb>=1.2.2"
    "r-rmarkdown"
    "r-rpostgres>=1.4.5"
    "r-rpostgresql"
    "r-rsqlite>=2.3.1"
)

# The unittests for `r-dbplyr` have multiple circular
# dependency chains.

# As such, the tests can not be run on first build.
# While R packages from CRAN, generally, are well-tested
# before they are released, in some situations, you want to
# have thorough testing on your own end.

# To run the tests, first build this package without `check()`
# (i.e., as-is) to bootstrap `r-dbplyr`. Then, on subsequent builds,
# (assumining you have a local repository that is accessible from
# the build chroot), uncomment the lines defining `checkdepends`, below,
# as well as the `check()` function further down

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat>=3.1.10"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("1902d757641cac63ede87695a1919493d41eff63a8455317b19ee1f1025d5fd2b36fd8ee143973736ae55ebef701556b5978363ffd0bfd11c711fbed9740742b")

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
