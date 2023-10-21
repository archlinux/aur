# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=syntenet
_pkgver=1.2.4
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
md5sums=('81bd02bbba83fcb7f62098b5fd2a1fc6')
sha256sums=('d5cb3ad5a92be38fa9a538dc856002464d4d353400d126f6840ed4e3bd74a02e')

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
