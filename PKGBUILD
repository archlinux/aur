# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SpliceWiz
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Easy, optimized, and accurate alternative splicing analysis in R"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
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
  r-crayon
  r-dbi
  r-deseq2
  r-doubleexpseq
  r-edger
  r-fgsea
  r-go.db
  r-knitr
  r-limma
  r-openssl
  r-rmarkdown
  r-rsubread
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$_pkgname-fix-build.patch::https://github.com/alexchwong/SpliceWiz/pull/55.patch"
        "link-zlib.patch")
md5sums=('95ad1603bebc847d12b7dc715aef923a'
         'b2cd7b9fa49f3bf5c59316f4398f7513'
         '6d95a56e1b05ba50e118ddbbee00f1cf')
sha256sums=('b2f1f1ff3f963191e0fd4a5c6708cc1f8feaf688b809fd827dd537c322de68a6'
            '40b63cd8360ba6a42d42f1dee89b742add5d561ba8d4e9e9280a945b5487cceb'
            '9489d25045c49fed8ee2277dfa6956d28d936faff43f94029a3a4cd80652af59')

prepare() {
  cd "$_pkgname"
  # fix build
  patch -Np1 -i "../$_pkgname-fix-build.patch"
  # link to zlib
  patch -Np1 -i ../link-zlib.patch
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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
