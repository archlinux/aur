# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Seurat
_pkgver=6.0.1
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
  r-lifecycle
  r-matrixstats
  r-parallelly
  r-patchwork
  r-pbapply
  r-pls
  r-png
  r-progressr
  r-rann
  r-rcolorbrewer
  r-rcpp
  r-rcppannoy
  r-rcpphnsw
  r-rlang
  r-rspectra
  r-rtsne
  r-scales
  r-scattermore
  r-sctransform
  r-seuratobject
  r-uwot
)

makedepends=(
  r-rcppeigen
  r-rcppprogress
  r-rcppthread
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
  r-base64enc
  r-biobase
  r-blosc
  r-bpcells
  r-circlize
  r-complexheatmap
  r-data.table
  r-delayedarray
  r-deseq2
  r-destiny
  r-enrichr
  r-fitdistrplus
  r-genomicranges
  r-ggrastr
  r-glmgampoi
  r-harmony
  r-hdf5r
  r-iranges
  r-leidenbase
  r-limma
  r-lmtest
  r-mast
  r-metap
  r-miniui
  r-mixtools
  r-monocle
  r-plotly
  r-presto
  r-r.utils
  r-rbioformats
  r-reticulate
  r-rfast2
  r-rocr
  r-rsvd
  r-s4vectors
  r-sf
  r-shiny
  r-singlecellexperiment
  r-sp
  r-spatstat.explore
  r-spatstat.geom
  r-spls
  r-summarizedexperiment
  r-testthat
  r-vgam
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5e94a7f325008831a79f0cde270e3ffb')
b2sums=('415d5f2fce6fa18860f8c23aa46d308e9d8e18c5b1a6bb8a99a9e01796332102880142d5675422805c1e90f297cc6c458bf7713589d7938c11128be1a1952084')

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
