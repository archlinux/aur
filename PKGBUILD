# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNAmodR
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Detection of post-transcriptional modifications in high throughput sequencing data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-colorramps
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-gviz
  r-iranges
  r-matrixstats
  r-modstrings
  r-rcolorbrewer
  r-reshape2
  r-rocr
  r-rsamtools
  r-rtracklayer
  r-s4vectors
)
checkdepends=(
  r-rnamodr.data
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-rnamodr.data
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-tests.patch")
md5sums=('ece4ec8fc16a95ec2ee8d9506283c57e'
         'f0971c84a5f969df3e1b055328db3ce3')
b2sums=('cd1f6441084dbc9d7edaf6b416d5e94187a5fc4fbbf496ce16fc6b2d56203eee19e06fba50662d1f47a2adc77f1d98920c6d7eddff1cab2509bfb23e58cd90ed'
        '92e9b74fbee5aa507b6bd1572973a0fc8878826105baa7f9e852216c2ad472fd84a1ca6b8d1255ba854b3ffc4f3068cdd3448cb03154ad162b931e103beb6d22')

prepare() {
  # fix tests
  patch -Np1 -i fix-tests.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
