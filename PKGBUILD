# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=revdbayes
_pkgver=1.5.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Ratio-of-Uniforms Sampling for Bayesian Extreme Value Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  lapack
  r-bayesplot
  r-exdex
  r-rcpp
  r-rust
)
makedepends=(
  r-rcpparmadillo
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-ggplot2
  r-knitr
  r-microbenchmark
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-tests.patch")
md5sums=('d45e11a9c6588568cbf133ad48e16b81'
         'dd7ce9091e07ca9a47821e8bcf561b08')
b2sums=('16cc44e738f685530db47d754fb476ad0e6df44fc303587c41fdfb6b2b4bd1a2fc04b591785f584594ddd03a0f955c7e95c0dc3e32b2bfebff68ab39aca2daba'
        '97d09c073f004e7b1afa24422817e8458534ed643a7b7a9d0dbfc48681fdee0187fcbe3ffc6b713cc5ad541106b055931ffa05be2c1828029f23daa92059371a')

prepare() {
  # skip long tests
  patch -Np1 -i fix-tests.patch
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
