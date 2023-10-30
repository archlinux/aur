# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocSingular
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Singular Value Decomposition for Bioconductor Packages"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-beachmat
  r-biocgenerics
  r-biocparallel
  r-delayedarray
  r-irlba
  r-rcpp
  r-rsvd
  r-s4vectors
  r-scaledmatrix
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-residualmatrix
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9b4158e143f2cbefc140228c13090b35')
sha256sums=('634824a2e15c13c9fefbb17605a3861bdced6fc182c8880ae862f2248600377c')

prepare() {
  # skip test that makes a coredump
  sed -i '/"scale calculations work correctly"/a\ \ \ \ skip("dumps core")' \
      "$_pkgname/tests/testthat/test-utils.R"
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
