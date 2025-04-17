# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=storr
_pkgver=1.2.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Simple Key Value Stores"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
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
md5sums=('63e12d87ce5965780333c1657048490b')
b2sums=('7c03815f3c7b6cc93204a6ee19018e50790198cc54cb6c2d4c9d9265c568501e284c6cc1953ac929ddd7d164daaa81164dd30c50b1e87ec01ff070c558e56cd3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
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
