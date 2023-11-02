# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=GenomeInfoDb
_bcver=1.38.0
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
    "r-biocstyle"
    "r-bsgenome"
    "r-bsgenome.celegans.ucsc.ce2"
    "r-bsgenome.hsapiens.ncbi.grch38"
    "r-bsgenome.scerevisiae.ucsc.saccer2"
    "r-genomicalignments"
    "r-genomicfeatures"
    "r-genomicranges"
    "r-knitr"
    "r-rsamtools"
    "r-runit"
    "r-txdb.dmelanogaster.ucsc.dm3.ensgene"
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
b2sums=('72c2d0b817b270c5df2842daa5c582e3cbbd4eda516ebd03cbf6d62a20c94f5c621acd923784fd6b9fb2a4c8c081e5788d3f8f166a925346209e69752f13d627')

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
