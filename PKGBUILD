# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Seurat
_pkgver=5.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for Single Cell Genomics"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cowplot
  r-fastdummies
  r-fitdistrplus
  r-future
  r-future.apply
  r-generics
  r-ggplot2
  r-ggrepel
  r-ggridges
  r-httr
  r-ica
  r-igraph
  r-irlba
  r-jsonlite
  r-leiden
  r-lifecycle
  r-lmtest
  r-matrixstats
  r-miniui
  r-patchwork
  r-pbapply
  r-plotly
  r-png
  r-progressr
  r-purrr
  r-rann
  r-rcolorbrewer
  r-rcpp
  r-rcppannoy
  r-rcpphnsw
  r-reticulate
  r-rlang
  r-rocr
  r-rspectra
  r-rtsne
  r-scales
  r-scattermore
  r-sctransform
  r-seuratobject
  r-shiny
  r-spatstat.explore
  r-spatstat.geom
  r-tibble
  r-uwot
)
makedepends=(
  r-rcppeigen
  r-rcppprogress
)
checkdepends=(
  r-glmgampoi
  r-harmony
  r-limma
  r-singlecellexperiment
  r-testthat
)
optdepends=(
  r-ape
  r-biobase
  r-biocgenerics
  r-bpcells
  r-data.table
  r-delayedarray
  r-deseq2
  r-enrichr
  r-genomeinfodb
  r-genomicranges
  r-ggrastr
  r-harmony
  r-hdf5r
  r-iranges
  r-limma
  r-mast
  r-metap
  r-mixtools
  r-monocle
  r-presto
  r-r.utils
  r-rfast2
  r-rsvd
  r-rtracklayer
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
  r-testthat
  r-vgam
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cb58cbc4b85dae89262c43f1d86c49ff')
b2sums=('bab400c3a6465734622d4439212e4cbd9d1324d949a75d4501b2f73bc20f6409a38fd509aa65049135253ffbf4940d332a2327fe5c5f8c43b5cca36fc2aae86a')

prepare() {
  # skip test that requires BPCells
  sed -i '/"pca is equivalent for BPCells"/a\ \ skip_if_not_installed("BPCells")' \
      "$_pkgname/tests/testthat/test_dimensional_reduction.R"
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
