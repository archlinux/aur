# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gemma.R
_pkgver=3.0.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A wrapper for Gemma's Restful API to access curated gene expression data and differential expression analyses"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=(Apache)
depends=(
  r-assertthat
  r-biobase
  r-bit64
  r-data.table
  r-digest
  r-glue
  r-httr
  r-jsonlite
  r-lubridate
  r-magrittr
  r-memoise
  r-rappdirs
  r-rlang
  r-s4vectors
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
checkdepends=(
  r-microbenchmark
  r-shiny
  r-testthat
)
optdepends=(
  r-biocstyle
  r-covr
  r-dplyr
  r-ggplot2
  r-ggrepel
  r-kableextra
  r-knitr
  r-listviewer
  r-magick
  r-microbenchmark
  r-pheatmap
  r-poolr
  r-purrr
  r-rmarkdown
  r-shiny
  r-testthat
  r-viridis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-tests.patch")
md5sums=('a2e517fc3b67e764a92df0be79c3ae37'
         'bab76fcffdce304d8fb0025cf5b5cc35')
b2sums=('a6e4e59a7754ea6819a879c3e9e72232f7a8e28d074416698e90befbf34940ecaa976824bb7b1e72ca98207f206b68ec1a8997339abce6f5f8fe26d7ed8f0e77'
        'b2a3868e4206533af9effd83dd4c534accbff5e821493a2a55bf18b2ca728967b57cba32de15c1e6fb20e3eaf6ab3160c3cb25a53d9978e0a03d3dcfce16ee08')

prepare() {
  # skip failing tests
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
