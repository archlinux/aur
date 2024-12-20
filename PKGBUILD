# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: articpenguin <julia.schweinz at mailfence dot com>

_pkgname=argparse
_pkgver=2.2.5
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
md5sums=('5a2f62c43bfaeee55e7888814d0a4a80')
b2sums=('ceee9fb0a0edcca0e58c076d95fc424f554bdaa6abd0b3a0a645fc6987a98b13abd2b8caa189678532f834982a4ecd9c5d7e7a86fc5233a67fa92f9234f7f66c')

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
