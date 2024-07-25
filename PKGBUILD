# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SpliceWiz
_pkgver=1.6.1
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
md5sums=('839fb053b6c4b7d766b65900e3659627'
         '6d95a56e1b05ba50e118ddbbee00f1cf')
b2sums=('705e874180c3f4370c351934c05ce05b55157653a8e9169643bbf62f6bb977652e297812cd01b6dcd9360610082a408cf100513d7c8072a15721b4204f2a77e8'
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
