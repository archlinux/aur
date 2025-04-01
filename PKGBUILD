# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RMySQL
_pkgver=0.11.1
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
md5sums=('790368795cdb44cb6c2293d54dc310b9')
b2sums=('436648cb302beecb7680cf576a13bf727e5b0df065dacb59236d695e11ca26cd4d20b86be5521b0fa78827669c3749e58cb207f6623e13955f3a38b7de0955e0')

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
