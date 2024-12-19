# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=RMariaDB
_pkgver=1.3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
  r-plogr
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
md5sums=('12d7b6e04c697f3a5964443c1592a1d8'
         '1d22cc9cd927ccadb76bfba898b7ef0b'
         'b53149b42ab18105619bbbcb568de1b7')
b2sums=('97a79a9d104d3600801415b2b7c74065282f6a58235ac625a2336fa6e69f591961d1dffd0f4289b26d9c83501c0d1f993931e322a3997995b43ed75da55afc73'
        'b7c84137a731058eb2a5c7854721077a7f442ae4dd201e851a353a3961b83ef6ab6e74e7be1a6a323c8043f53d970bee3033907b7d31da60947df75d2c97e2d4'
        'c2db9ab7fa0c73547a80cc15dc7a51a62cfb25a840b7d901bc4b0d4da3c99eb987faaa73cbeac1529fb219a29e3963f9fe3c956f7283f18c53ad1a7208d07636')

prepare() {
  # skip failing tests
  patch -Np1 -i skip-tests.patch
  # use system boost headers
  patch -Np1 -i system-boost.patch
}

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
