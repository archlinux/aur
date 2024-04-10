# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: articpenguin <julia.schweinz at mailfence dot com>

_pkgname=argparse
_pkgver=2.2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Command Line Optional and Positional Argument Parser"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  python
  r-findpython
  r-jsonlite
  r-r6
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a3d1cf4737fcccb4cd0ef0da970e61df')
b2sums=('9da45954a4e2d941bd62eab33c3d66926524d0dae50a451b25d26e815d237fc9bd1628e6a9a8f1c372cd87f445a8dd5f14384ac0105fb6f786780b2166f195d7')

prepare() {
  # fix tests
  sed -e 's/test-argparse.R/run-all.R/' \
      -e 's/usage: PROGRAM/usage: run-all.R/' \
      -i "$_pkgname/tests/testthat/test-argparse.R"
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla run-all.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
