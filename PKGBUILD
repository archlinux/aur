# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=GenomeInfoDb
_bcver=1.36.4
pkgname="r-${_bcname,,}"
pkgver="${_bcver//[:-]/.}"
pkgrel=1
pkgdesc="Utilities for manipulating chromosome names, including modifying them to follow a particular naming style"
arch=("any")
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=("Artistic2.0")

depends=(
    "r>=4.0.0"
	"r-biocgenerics>=0.37.0"
	"r-s4vectors>=0.25.12"
	"r-iranges>=2.13.12"
	"r-rcurl"
	"r-genomeinfodbdata"
)
optdepends=(
    "r-genomicranges"
    "r-rsamtools"
    "r-genomicalignments"
    "r-genomicfeatures"
    "r-txdb.dmelanogaster.ucsc.dm3.ensgene"
    "r-bsgenome"
    "r-bsgenome.scerevisiae.ucsc.saccer2"
    "r-bsgenome.celegans.ucsc.ce2"
    "r-bsgenome.hsapiens.ncbi.grch38"
    "r-runit"
    "r-biocstyle"
    "r-knitr"
)

# The unittests for `r-pkgcache` have circular
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
#     "r-rcmdcheck"
# )

source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("5db013dd07fe04a1249731ffd9bd7424d7ace589ccce408c6c467fca2282861385c69403475c14ecea1925e6cfd00d10702b961b2dccc070538f811f34ccbf79")

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}/build/"
}

# check() {
#     cd "${srcdir}/${_bcname}/"
#     R_LIBS="${srcdir}/build/" R CMD check --no-manual --no-multiarch --no-vignettes .
# }

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_bcname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_bcname}/LICENSE" ]]; then
        install -Dm0644 "${_bcname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
