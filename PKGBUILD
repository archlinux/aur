# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Seurat
_pkgver=5.2.1
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
  r-leidenbase
  r-lifecycle
  r-lmtest
  r-matrixstats
  r-miniui
  r-patchwork
  r-pbapply
  r-plotly
  r-png
  r-progressr
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
  r-ape
  r-arrow
  r-glmgampoi
  r-harmony
  r-hdf5r
  r-limma
  r-metap
  r-sf
  r-singlecellexperiment
  r-testthat
)
optdepends=(
  r-ape
  r-arrow
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
  r-glmgampoi
  r-sf
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d6233a192fd8f84a5db6daaaef79c91d')
b2sums=('f28390e4d6c10c40ffaa34db22f0be76601e5a0a88a4d20f12eef9b6f96567166d58d6222de9d3ce5f50186f5c02024d64dfcaacc2001b5a792a7a9f985cbb2b')

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
