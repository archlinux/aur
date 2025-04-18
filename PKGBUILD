# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DelayedRandomArray
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Delayed Arrays of Random Values"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-delayedarray
  r-dqrng
  r-rcpp
  r-sparsearray
)
makedepends=(
  r-bh
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('35a58b38c0bc2a89ce1aa2d680494ad7')
b2sums=('b8503eb3f6ec5e17cc0900e088b5b34ddcc5ec3e161903dc892a0b846ef9e942798fcf464d0ea8e4a82fa8d5be9d78967720c641482b1765daeb6c7c56d420b7')

prepare() {
  # fix test
  sed -i '/recycle_vector(X, 100/ s/list(NULL, NULL)/list(NULL)/' \
      "$_pkgname/tests/testthat/test-recycle.R"
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
