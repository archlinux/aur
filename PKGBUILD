# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hermes
_pkgver=1.10.0
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
md5sums=('66f15d90a3af1663393f1904bbdd74f0'
         'b913685944ab7f820abfa5d3fddc95ae')
b2sums=('87b5cd68db0eeb2994cba190ca76fb45e53c4907a477eb4f6057ab7832cfa6a4af5487a73f800207babfe4012f7542cc973aa942e03d1e305a79b692b4e9c183'
        'b6de64020a5beea8add0fcf55e1389ca8404fcb0ee8bbb7260966ca2a6062c8e94c79f4d0964234fb6fe379b26fa15b426d51e59fd724560b0f954b2072e7106')

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
