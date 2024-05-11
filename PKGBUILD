# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=APL
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Association Plots"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-ggplot2
  r-ggrepel
  r-magrittr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-plotly
  r-reticulate
  r-rlang
  r-seurat
  r-singlecellexperiment
  r-summarizedexperiment
  r-topgo
  r-viridislite
)
checkdepends=(
  python-pytorch
  r-testthat
)
optdepends=(
  "python-pytorch: faster singular value decomposition"
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-scater
  r-scran
  r-scrnaseq
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a0515d71d7bde81144faf297c5e384b2')
b2sums=('d6abf45d5e625a3c69ea26a773d9d07d453662ac71f94c88072701868578ff41c9a729a24ea988dbee8d4946929c41520f7de55ae72e5b018f75baf082c98a51')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"

  # compile python bytecode
  python -m compileall -o 0 -o 1 -s build -p /usr/lib/R/library "build/$_pkgname/python"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
