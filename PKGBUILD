# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: articpenguin <julia.schweinz at mailfence dot com>

_pkgname=argparse
_pkgver=2.3.1
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
md5sums=('5b410d180316d945aba03f744fccc904')
b2sums=('83babf79a34f83d7dd948f4b0bdf29cfd3f6574d654fd696ee7a802963070988fe634ea804115eb5308f5e31b19c347eaa9aa132168efc043d78a0ea4547a1e7')

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
