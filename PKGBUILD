# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nnSVG
_pkgver=1.10.3
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
md5sums=('4dd7a3a2d32e832399295cb239e2065d'
         '41ab7394f6ddcf0b0751e14cbe78b1d1')
b2sums=('40512f99d38c9f09ce7e57edfb839979861b5ec3fc0f9ac7ac5413c44289a3d80a1cd9497f63a6bb81db8c3b04236c358f70616fd871fa50b831a91b1b9bd3aa'
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
