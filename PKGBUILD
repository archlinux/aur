# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SpliceWiz
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="interactive analysis and visualization of alternative splicing in R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-annotationhub
  r-biocfilecache
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-data.table
  r-delayedarray
  r-delayedmatrixstats
  r-dt
  r-fst
  r-genefilter
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-hdf5array
  r-heatmaply
  r-htmltools
  r-iranges
  r-magrittr
  r-matrixstats
  r-nxtirfdata
  r-ompbam
  r-patchwork
  r-pheatmap
  r-plotly
  r-progress
  r-r.utils
  r-rcolorbrewer
  r-rcpp
  r-rhandsontable
  r-rhdf5
  r-rtracklayer
  r-rvest
  r-s4vectors
  r-scales
  r-shiny
  r-shinydashboard
  r-shinyfiles
  r-shinywidgets
  r-stringi
  r-summarizedexperiment
  zlib
)
makedepends=(
  r-rcppprogress
  r-zlibbioc
)
checkdepends=(
  r-rsubread
  r-testthat
)
optdepends=(
  r-annotationdbi
  r-crayon
  r-dbi
  r-deseq2
  r-doubleexpseq
  r-edger
  r-fgsea
  r-go.db
  r-knitr
  r-limma
  r-rmarkdown
  r-rsubread
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "link-zlib.patch")
md5sums=('2040c299f3714617473d6e1d86b79e30'
         '6d95a56e1b05ba50e118ddbbee00f1cf')
b2sums=('ab9fce493d2bd7585c72c4f8eef428f880286c1a8ce541a039effc1f32c905413432badc54777d75c6a81ec37e38a21dda2245fe8e618470a2af7f87e5b5338f'
        'c81190033eaba3e11043f9eb9ab2e0275b37a40ba6d5ad821a37560c74f3dc65a0fe3e0e9c4825fcc23e6bd9a7084ff0ba144daa6ef7b564517e4af2b4471362')

prepare() {
  cd "$_pkgname"
  # link to zlib
  patch -Np1 -i ../link-zlib.patch
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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
