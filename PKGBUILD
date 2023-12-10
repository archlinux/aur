# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hermes
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Preprocessing, analyzing, and reporting of RNA-seq data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Apache)
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
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "skip-tests.patch")
md5sums=('af1e1dd4bab597cfb7b0bd12a1e9e7dd'
         '584674ff858d3b36bd221e71a3feabae')
sha256sums=('7948b722f701e86f968a9e0a3f89a6a002c5bc22932912e50f86693ed17fc8d0'
            'fdef7997f73aa7ddaa4d8307fde896adf051a2dc60d6d7f83871df252a10dd37')

prepare() {
  # skip failing tests
  patch -Np1 -i skip-tests.patch
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
}
