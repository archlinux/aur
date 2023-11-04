# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Seurat
_pkgver=5.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for Single Cell Genomics"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
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
md5sums=('0815d7d51e297bf1f4975cefb60e2b6d')
sha256sums=('bb8c91610f58753aa57f38bf2ef1c97c9c85fbfe89c1c47a33805f3eb5eb78c3')

prepare() {
  # skip test that requires BPCells
  sed -i '/"pca is equivalent for BPCells"/a\ \ skip_if_not_installed("BPCells")' \
      "$_pkgname/tests/testthat/test_dimensional_reduction.R"
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
