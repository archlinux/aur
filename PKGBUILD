# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RMySQL
_pkgver=0.10.26
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Database Interface and 'MySQL' Driver for R"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
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
md5sums=('7ff38becce5ebf21c6a5751e6ebba16b')
sha256sums=('45bb5b20a38b1f7d3a58a1c15c9d57707d603b01a3021423d1d57367a4ef637a')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
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
