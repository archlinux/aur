# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=RPostgres
_pkgver=1.4.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="C++ Interface to PostgreSQL"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  postgresql-libs
  r-bit64
  r-blob
  r-dbi
  r-hms
  r-lubridate
  r-withr
)
makedepends=(
  boost
  r-cpp11
  r-plogr
)
checkdepends=(
  postgresql
  r-dbitest
  r-testthat
)
optdepends=(
  r-callr
  r-covr
  r-dbitest
  r-knitr
  r-rlang
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "system-boost.patch")
md5sums=('1a7eb8600a0ee26082723a516bbd16d5'
         '77a2948b75606cdf00a4e6fa280c6ce9')
b2sums=('45a98d058d5b8699b5c82e696fe6f8b1e92b4bf5129d8893befe92b3d08fadc661fce8466df145ca2e835212d267da6a8b5681d9892255adf9c4ce4b450b9c87'
        '6f013b9a2d207e4254eae54459db66ae2e3576c8e9d62fd0cec8c403ec6253d67ef85e316240c8d8e60703cad07201bbb50797edf12a7ca2ddb727e5685c4b9a')

prepare() {
  # use system boost library
  patch -Np1 -i system-boost.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"

  # create database for tests
  export PGDATA=db
  export PGHOST="$(pwd)/host"
  mkdir host
  initdb
  pg_ctl -o "-h '' -k ${PGHOST@Q}" start
  createdb

  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R

  # shut down test database
  pg_ctl stop
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
