# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nanoparquet
_pkgver=0.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
  r-duckdb
  r-hms
  r-mockery
  r-spelling
  r-testthat
)
optdepends=(
  r-arrow
  r-bit64
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
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "system-libs.patch")
md5sums=('7c28efad8ac44cf4224cab1819478571'
         '142ce5b5fa0a8a2c6f3862920a3e670d')
b2sums=('b75595ec44c122cf2e18192330970e3ccb45439afa1a87edb1c23655c198f875f78b62a5826c89ba1f2bf5e00c7bea53efd525749ecf0a63bd0d5501a1df4294'
        '30ebb0ccb828ef0c40cbdd78cf07e9885f7a4240e076b220eb0c90c3609d449be9aef34ce99548869966cd446201bf1d3b9374e4184c93e4992f73bfa4906e15')

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
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
