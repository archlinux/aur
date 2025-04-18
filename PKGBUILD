# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IgGeneUsage
_pkgver=1.22.0
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
md5sums=('45fd335257bb1b7c2382d1883392b952')
b2sums=('e44ad58452f861eb710336ef76109f5beeccd301c327d49ed8f97c49b6d0040ffa6b714fd0c9832e1c8daeace1f9eaca1b247853dc32a4ae1144ad4a98c8d667')

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
