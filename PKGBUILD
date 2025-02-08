# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RMySQL
_pkgver=0.11.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Database Interface and 'MySQL' Driver for R"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  mariadb-libs
  r-dbi
)
checkdepends=(
  mariadb
  r-testthat
)
optdepends=(
  r-curl
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cf46ee8e3c91d982fd59730bab715eba')
b2sums=('ea44bb819b0edaf9688fe790b2c07a225d9a2e5410cea609a7f5555a916b7a67c05f67c84d892818f8ab208c191f0dcb04f954131fc6837c3f44797340cc364a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"

  # create database for tests
  export HOME="$srcdir" # make sure mariadb doesn't read ~/.my.cnf
  export MARIADB_HOME="$srcdir/mariadb"
  mkdir -p "$MARIADB_HOME/data"
  cat > "$MARIADB_HOME/my.cnf" << EOF
[client-server]
socket="$MARIADB_HOME/mariadb.sock"

[server]
skip_networking=1
datadir="$MARIADB_HOME/data"
EOF
  mariadb-install-db
  mariadbd &
  sleep 1 # wait for the server to start up

  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R

  # shut down test database
  mariadb-admin shutdown
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
