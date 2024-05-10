# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hermes
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Preprocessing, analyzing, and reporting of RNA-seq data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Apache-2.0')
depends=(
  r-assertthat
  r-biobase
  r-biocgenerics
  r-biomart
  r-checkmate
  r-circlize
  r-complexheatmap
  r-deseq2
  r-dplyr
  r-edger
  r-envstats
  r-forcats
  r-genomicranges
  r-ggfortify
  r-ggplot2
  r-ggrepel
  r-iranges
  r-lifecycle
  r-limma
  r-magrittr
  r-matrixstats
  r-multiassayexperiment
  r-purrr
  r-r6
  r-rdpack
  r-rlang
  r-s4vectors
  r-summarizedexperiment
  r-tidyr
)
checkdepends=(
  r-testthat
  r-vdiffr
)
optdepends=(
  r-biocstyle
  r-delayedarray
  r-dt
  r-httr
  r-knitr
  r-rmarkdown
  r-statmod
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-tests.patch")
md5sums=('e2a043604334a9302285e5864ecd72ab'
         '029546b1d58fdda69b7ffa514d60f183')
b2sums=('a6264580c5c9d0591e4f5e3c0e9017e3f2666282d627beac7699d83572529646e053e5632de9ef76e615eab2226f5f0a568d22957d4bbe04d659a5f895491af3'
        'cc64529e5965906de4292e712770f226e991a549d4bf6fe9b18db1b60fcdd0a4033a9aeb9ff7c59ccf1b2fe94dc69e9e492641a9df5b8579742abf726a36083b')

prepare() {
  # fix snapshot tests
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
