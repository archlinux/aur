# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=APL
_pkgver=1.16.0
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
  r-rlang
  r-rspectra
  r-seuratobject
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
  r-sparsematrixstats
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ea5e824768573263a76130b20d121e6d')
b2sums=('fc9c049f780166b6b8b2df3274cb1ce19dc673fd3825e4b61d27d2c467626870ee12b0c409ee5fd3841313d9e7a0b9f8e8b6588af1764b050770ab27c6865fb6')

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
