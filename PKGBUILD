# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=RoBTT
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Robust Bayesian T-Test"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-bayestools
  r-bridgesampling
  r-ggplot2
  r-rcpp
  r-rcppparallel
  r-rdpack
  r-rstan
  r-rstantools
)
makedepends=(
  r-bh
  r-rcppeigen
  r-stanheaders
)
checkdepends=(
  r-testthat
  r-vdiffr
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0989bc4c3bac8e9dbda570a42c3ee3b7')
sha256sums=('79db72dfdf2e5ba5e942daf575cc657fff46a49f8bac78c097c67dcbcdd7a910')

prepare() {
  # skip test that requires external files
  sed -i '1a skip("Requires external files")' \
      "$_pkgname/tests/testthat/test-4-diagnostics.R"
}

build() {
  mkdir -p build
  # compilation needs a lot of memory
  MAKEFLAGS+=" -j1"
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
