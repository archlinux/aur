# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=speckle
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical methods for analysing single cell RNA-seq data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-edger
  r-ggplot2
  r-limma
  r-seurat
  r-singlecellexperiment
)
checkdepends=(
  r-testthat
  r-vdiffr
)
optdepends=(
  r-biocstyle
  r-cellbench
  r-jsonlite
  r-knitr
  r-patchwork
  r-rmarkdown
  r-scater
  r-statmod
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-tests.patch")
md5sums=('02df000664c70b6ee85aa74170cb6248'
         '8af9b352ae92d11644cae8af98be635a')
b2sums=('785c521bfe381a48a6e2910c41d419780b53b3ad5d582df0f6cf0ed3ba0eb559386e86579f7eac76ab6cff44afe4c8b5ed07902b0b7ba482631ad965b4bbecb2'
        '3675d038b8f1a3df4a57c6227608bec986efcc0b8a551f1a5aec33cdcd19573c37c9f5ea2a7bdd37585187d6c8fd25c6cc849b9d5abad51e3d73bebec7af16c5')

prepare() {
  # fix test snapshots
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
