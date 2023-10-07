# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: articpenguin <julia.schweinz at mailfence dot com>

_pkgname=argparse
_pkgver=2.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Command Line Optional and Positional Argument Parser"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
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
md5sums=('fe22b79b423ac686d072694fe30b8617')
sha256sums=('b62c9bf5e6ca35fb7a2e614a916815c04cbf6c6db3f89f99b4df76470a4a856d')

prepare() {
  # fix tests
  sed -e 's/test-argparse.R/run-all.R/' \
      -e 's/usage: PROGRAM/usage: run-all.R/' \
      -i "$_pkgname/tests/testthat/test-argparse.R"
}

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla run-all.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
