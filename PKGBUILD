# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tiledb
_pkgver=0.27.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Modern Database Engine for Complex Data Based on Multi-Dimensional Arrays"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-nanoarrow
  r-nanotime
  r-rcpp
  r-spdl
  tiledb
)
makedepends=(
  r-rcppint64
)
checkdepends=(
  r-arrow
  r-data.table
  r-nycflights13
  r-palmerpenguins
  r-tinytest
)
optdepends=(
  r-arrow
  r-bit64
  r-curl
  r-data.table
  r-nycflights13
  r-palmerpenguins
  r-simplermarkdown
  r-tibble
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "skip-tests.patch")
md5sums=('72f5fdefa935d12ba713819209291791'
         '65589ce8628e97f3ef75905ba16cd8fa')
b2sums=('84620caa4fb257d237da33e9cfe4074cab0a788dc026d4f643a65b724c89788c563c2bee8e6d00dc8517048a7fe64ea9f1c4ecef1ce3f680ef08d67a37f0ca93'
        'd82cae045055f52ca11160181df950e4f44773cac3ccd8c04de78f8ba5901b46d9095d9439b86ce78ba0804d98ef9ee6fdffc3ed76b7cda3d1e5c0ffd9b22449')

prepare() {
  # skip tests that make a coredump
  patch -Np1 -i skip-tests.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla tinytest.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
