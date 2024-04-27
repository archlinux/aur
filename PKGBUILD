# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=storr
_pkgver=1.2.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('0bec8b9e53ad575bd9a20b68a798f853')
b2sums=('ea904e834ecf5a4d075b81262ccbea74103f780d03f79ef8e8b8755ad65edf9e51bf4107d1be45a03256d95540d4c8df72a30dcdd268c2bbb2675852ca971757')

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
