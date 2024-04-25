# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RMySQL
_pkgver=0.10.27
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('82055849b6008a804c59c5f1a9dafdaf')
b2sums=('3a846ffffae569da472cc75e9cccfd55b3ea35c05ba159f736f317e634884e74fe7f92146c7b24a04896680fdca91a7a76468b69a948447875ddc1a6fd212c47')

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
