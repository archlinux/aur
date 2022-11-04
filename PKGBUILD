# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=gpart
_pkgver=1.13.0
pkgname=r-${_pkgname,,}
pkgver=1.13.0
pkgrel=4
pkgdesc='Human genome partitioning of dense sequencing data by identifying haplotype blocks'
arch=('x86_64')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationdbi
  r-biomart
  r-data.table
  r-genomicranges
  r-homo.sapiens
  r-igraph
  r-iranges
  r-organismdbi
  r-rcpp
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
makedepends=(
  patch
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/3.15/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix_pi.patch")
sha256sums=('4d8b149f072e10ad1ad149bf09325871cb08d740511bcaef9b4c08aea6e42894'
            '033774f380e8c8edbe056b8dd2b076bcd408895a4ecaa75eb6da5e1c99caae70')

prepare() {
  cd "${srcdir}/${_pkgname}"

  # fix misspelled PI macro/variable
  patch -Np0 -i "${srcdir}/fix_pi.patch"
}

build() {
  # create staging directory for installation
  mkdir -p "${srcdir}/staged"

  R CMD INSTALL "${_pkgname}" -l "${srcdir}/staged"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${srcdir}/staged/${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
