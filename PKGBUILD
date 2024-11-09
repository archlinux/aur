# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IgGeneUsage
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Differential gene usage in immune repertoires"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  onetbb
  r-rcpp
  r-rcppparallel
  r-reshape2
  r-rstan
  r-rstantools
  r-summarizedexperiment
  r-tidyr
)
makedepends=(
  r-bh
  r-rcppeigen
  r-stanheaders
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-ggforce
  r-ggplot2
  r-ggrepel
  r-knitr
  r-patchwork
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0432bed8882294ef0ac0747430bbd02a')
b2sums=('7e0570c66b9c5f270715a066c40d518bf2d72c5668659abf77aaa183098ff333a638a207f32acf1d0924a97bf1186f2dec7e7128ba0f99cb153dc3eec6d49571')

build() {
  mkdir build
  # compilation needs a lot of memory
  MAKEFLAGS+=" -j1"
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
