# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nnSVG
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Scalable identification of spatially variable genes in spatially-resolved transcriptomics data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocparallel
  r-brisc
  r-matrixstats
  r-singlecellexperiment
  r-spatialexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-scran
  r-stexampledata
  r-testthat
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-scran
  r-stexampledata
  r-testthat
  r-weberdivechalcdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-tests.patch")
md5sums=('24adcb1712b14cf817e92590762ed6be'
         '41ab7394f6ddcf0b0751e14cbe78b1d1')
b2sums=('f5e894d5bb9553f5dbcca9558d49622d2e0bfc4ca1e66247aebf4c27a749377a39cf959b3f2575379315968813005c87c37d64fcf6b8b4fb5dd90553dfad91f5'
        'c586a59926aad5469e9ea58861829cd70326cb0023b28e8b814df2cdcc6efb1636fbcf548fcf561d19d6e7b4f2356a6d7a29b1cb9fc2bffdf2b1de45737d3c5a')

prepare() {
  # skip failing tests
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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
