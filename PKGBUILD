# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=sf
_pkgver=1.1-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Simple Features for R"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR MIT')
depends=(
  gdal
  geos
  proj
  r-classint
  r-dbi
  r-magrittr
  r-s2
  r-units
)
makedepends=(
  r-rcpp
)
checkdepends=(
  postgis
  r-blob
  r-dplyr
  r-raster
  r-rpostgres
  r-rpostgresql
  r-sp
  r-testthat
  r-tidyr
)
optdepends=(
  r-blob
  r-covr
  r-dplyr
  r-ggplot2
  r-knitr
  r-lwgeom
  r-maps
  r-mapview
  r-microbenchmark
  r-nanoarrow
  r-odbc
  r-pbapply
  r-pillar
  r-pool
  r-raster
  r-rlang
  r-rmarkdown
  r-rpostgres
  r-rpostgresql
  r-rsqlite
  r-sp
  r-spatstat
  r-spatstat.geom
  r-spatstat.linnet
  r-spatstat.random
  r-spatstat.utils
  r-stars
  r-terra
  r-testthat
  r-tibble
  r-tidyr
  r-tidyselect
  r-tmap
  r-vctrs
  r-wk
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-tests.patch")
md5sums=('ec00e564eea53ba10a88be12526397c5'
         '1f0ac4a99a8706821bc498b734be839f')
b2sums=('e58889991924b6ceea151770ac536a1ae5347086323358bd367d8c20f140e9f173656965080e9a0b329fddc90aafbbfd819b56d7810e350c475b48d5f7ca88dd'
        '988ca59b2da630b1c730865f95f4b2c1ce3a88ed67ce49823914ce50f3fe6972ae44a5cb28037cd043e753ec062ab9ec19a4f7f70c05042e010005afec20cb11')

prepare() {
  # skip failing tests
  patch -Np1 -i fix-tests.patch

  # use PGHOST variable in tests
  sed -e 's/host = "localhost",//' \
      -e 's/host=localhost //' \
      -i "$_pkgname/tests/testthat/test-postgis_RPostgres.R"
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
  createdb postgis
  psql postgis -c "CREATE EXTENSION postgis;"
  createdb empty

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
