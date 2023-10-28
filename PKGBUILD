# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=syntenet
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Inference And Analysis Of Synteny Networks"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-biocparallel
  r-biostrings
  r-genomicranges
  r-ggnetwork
  r-ggplot2
  r-igraph
  r-intergraph
  r-networkd3
  r-pheatmap
  r-rcolorbrewer
  r-rcpp
  r-rlang
  r-rtracklayer
)
makedepends=(
  r-testthat
)
checkdepends=(
  r-xml2
)
optdepends=(
  r-biocstyle
  r-covr
  r-ggtree
  r-knitr
  r-labdsv
  r-rmarkdown
  r-testthat
  r-xml2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ab56b637f74d79cfba3dd6aab80b7ac9')
sha256sums=('023956e4272163608eea70636a88815e86ef214692fe3b3df37988e20d3b2f9c')

prepare() {
  # skip tests that cause a coredump
  sed -i '1i skip("dumps core")' "$_pkgname/tests/testthat/test-03_synteny_detection.R"
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
