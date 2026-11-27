# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=APL
_pkgver=1.18.0
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
md5sums=('00f3467bb603976105b40ace78bd93fb')
b2sums=('727929dea49e090a95dc1d9a5ab54a03a109dbf0b34e981777e5e08a898fa35957b12aadf79292a058b3e6da25d456747d9189cf203e4464ed36dbf6b3713154')

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
