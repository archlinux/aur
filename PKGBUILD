# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=syntenet
_pkgver=1.4.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Inference And Analysis Of Synteny Networks"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
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
md5sums=('707c5e37a241e40c0d5c99f3dbbe4a08')
b2sums=('31fa900433a340eecd3fee9999ca360f9e9df68e76924dc294a458489e13b0536d6767ab55f6a8d7be60fdb3f2c9e3a3ef1e4a00052ee2785b751a4cbc712217')

prepare() {
  # skip tests that cause a coredump
  sed -i '1i skip("dumps core")' "$_pkgname/tests/testthat/test-03_synteny_detection.R"
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
