# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=storr
_pkgver=1.2.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Simple Key Value Stores"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  r-digest
  r-r6
)
checkdepends=(
  postgresql
  r-dbi
  r-mockr
  r-rpostgres
  r-rsqlite
  r-testthat
)
optdepends=(
  r-dbi
  r-knitr
  r-mockr
  r-progress
  r-rbenchmark
  r-rmarkdown
  r-rpostgres
  r-rsqlite
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0bec8b9e53ad575bd9a20b68a798f853')
sha256sums=('4224c3991d9c043a45ce530d0698d7f2cdca231b26fe31b45e0db865026e5f63')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"

  # create database for tests
  export PGDATA="$srcdir/db"
  export PGHOST="$srcdir/host"
  mkdir "$PGHOST"
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
