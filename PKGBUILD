# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DelayedRandomArray
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Delayed Arrays of Random Values"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-delayedarray
  r-dqrng
  r-rcpp
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
md5sums=('d4147f1b05d871632f2549d95a775883')
sha256sums=('1b8aec3ea3c3df87350c4ef94acd17dd8887a9d16d14c0b966318d73680a9e36')

prepare() {
  # fix test
  sed -i '/recycle_vector(X, 100/ s/list(NULL, NULL)/list(NULL)/' \
      "$_pkgname/tests/testthat/test-recycle.R"
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
