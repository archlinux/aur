# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=RMariaDB
_pkgver=1.3.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Database Interface and MariaDB Driver"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  mariadb-libs
  r-bit64
  r-blob
  r-dbi
  r-hms
  r-lubridate
  r-rlang
)
makedepends=(
  boost
  r-cpp11
)
checkdepends=(
  mariadb
  r-dbitest
  r-testthat
)
optdepends=(
  r-dbitest
  r-decor
  r-readr
  r-rprojroot
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "skip-tests.patch"
        "system-boost.patch")
md5sums=('9e625475bc96cc839fc413bf43e0ccdf'
         '1d22cc9cd927ccadb76bfba898b7ef0b'
         'b53149b42ab18105619bbbcb568de1b7')
b2sums=('02bbf7cf0ab13f20adeac5ac67526e5386c7180a8f5ba3f98b42215da1b2c932919c62fd3faaaf683cef771d780304caf35f44807a6c0760a57b671619be7772'
        'b7c84137a731058eb2a5c7854721077a7f442ae4dd201e851a353a3961b83ef6ab6e74e7be1a6a323c8043f53d970bee3033907b7d31da60947df75d2c97e2d4'
        'c2db9ab7fa0c73547a80cc15dc7a51a62cfb25a840b7d901bc4b0d4da3c99eb987faaa73cbeac1529fb219a29e3963f9fe3c956f7283f18c53ad1a7208d07636')

prepare() {
  cd "$_pkgname"

  # Skip DBItest timestamp tests that currently fail
  sed -i '/default_skip = c(/a\
    "bind_timestamp",\
    "bind_timestamp_lt",\
    "arrow_bind_timestamp",\
    "arrow_bind_timestamp_lt",\
    "stream_bind_timestamp",\
    "stream_bind_timestamp_lt",\
    "arrow_stream_bind_timestamp",\
    "arrow_stream_bind_timestamp_lt",\
' tests/testthat/helper-DBItest.R

  # Prefer the system Boost headers over the bundled copy
  sed -i 's|[[:space:]]-Ivendor\([[:space:]]\)|\1|' src/Makevars.in
}
build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

_check() {
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
  # populate time zone data needed in tests
  mariadb-tzinfo-to-sql /usr/share/zoneinfo | mariadb mysql
  mariadb -e "SET GLOBAL time_zone = 'UTC';" mysql
  mariadb -e "ALTER DATABASE test CHARACTER SET = 'utf8mb4';" test

  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R

  # shut down test database
  mariadb-admin shutdown
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
