# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RMySQL
_pkgver=0.10.28
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
md5sums=('4b76d49f1853dddd6b633e570ebc4dd4')
b2sums=('52cdf1fdd0055e68cbb7f9c04edb8da572a853b9db6e28f8a949f26729c3d2550dc606bd2d55d1969493d096c66a698417f6d730ac81c6b69752a5c527e39fde')

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
