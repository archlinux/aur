# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=speckle
_pkgver=1.8.0
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
md5sums=('f3ce712b01cd59ea3dd95c99deaba034'
         '8af9b352ae92d11644cae8af98be635a')
b2sums=('a9f50a9ad81fa30a2424aa813eb2b51d68b3d581b0e7de7ac4e829c312897735819b85c980c76ce2294d158af03cbaa1d171ca23edd474187e764539c65ac7f4'
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
