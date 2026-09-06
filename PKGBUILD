# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nanoparquet
_pkgver=0.5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Read and Write 'Parquet' Files"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
  snappy
  thrift
  zstd
)
checkdepends=(
  python-pandas
  python-pyarrow
  r-arrow
  r-bit64
  r-blob
  r-duckdb
  r-hms
  r-mockery
  r-spelling
  r-testthat
)
optdepends=(
  r-arrow
  r-bit64
  r-blob
  r-dbi
  r-duckdb
  r-hms
  r-mockery
  r-pillar
  r-processx
  r-rprojroot
  r-spelling
  r-testthat
  r-withr
  r-tzdb
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "system-libs.patch")
md5sums=('b439a90ae836dbb571bd3c1050542e02'
         'cf09d29ea2a40167da7e4563ef66beff')
b2sums=('d852ac361ffe313bff4b1a001f3e0171b1a32c234823cf14c723a0b864fa86af884787ccb216780a8b22c0e51bd328e38676048d518af81ef1d3c4211961152a'
        '4dc0680b02138f312b33efe03b30c2bcec289aed768dd2cb3b0e962056f4c107ef9e131eb582692f38b360d56dc49cd0d56bfaf280cea8ff5f732ed902e76268')

prepare() {
  # use system libraries
  patch -Np1 -i system-libs.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
