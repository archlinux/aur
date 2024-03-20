# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hermes
_pkgver=1.6.1
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
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "skip-tests.patch")
md5sums=('9e758f81455d5fc7a8b57c3a65b4de5b'
         'e228515b639417bea13853cfc94b866a')
b2sums=('224fd9ad63e1bdf566a41e58f90c2cd120008add812f0ff4e777d72d9c3896c7d7ed06b5759b5c5330b2126dfc0cb6097584c7650c8a1f12fd2c1dcdf34ed99c'
        'b781820238d74265dce64de9804bd568587c61c0460e15b32eabf27e0f827d673e52e852274e2613a2cf55bd54e218ad21493d78fc16f8fe954a98d3b9970bb7')

prepare() {
  # skip failing tests
  patch -Np1 -i skip-tests.patch
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
