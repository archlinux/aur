# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNAmodR
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Detection of post-transcriptional modifications in high throughput sequencing data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
sha256sums=('f72ea20cafaf7371c428f67408701abfa223d30570242c3abbb4b7611e13b355'
            '7a73648f069ad74cc900f7c10feb447eae5e3cb5467a9e51e27ab720f9ea9e63')

prepare() {
  # fix tests
  patch -Np1 -i fix-tests.patch
}

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
