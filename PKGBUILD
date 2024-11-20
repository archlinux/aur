# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: articpenguin <julia.schweinz at mailfence dot com>

_pkgname=argparse
_pkgver=2.2.4
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
md5sums=('7376abe8e43b16c7e0729fafc34bd79e')
b2sums=('e7fbc9deea7c23cc0f0164c05ee1d2c6a00efca61362d3281add71f8d3bb854e790388ca06664c2caaac5bd002855250cd89450209e5c9ac4ae579de5838ced7')

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
