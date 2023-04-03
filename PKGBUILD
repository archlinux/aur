# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=RSQLite
_cranver=2.3.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="SQLite Interface for R"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL)
depends=(
    r-bit64
    r-blob
    r-dbi
    r-memoise
    r-pkgconfig
    sqlite
)
makedepends=(boost r-cpp11 r-plogr)
checkdepends=(r-dbitest r-testthat)
optdepends=(
    r-callr
    r-dbitest
    r-gert
    r-gh
    r-knitr
    r-magrittr
    r-rmarkdown
    r-hms
    r-rvest
    r-testthat
    r-withr
    r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('9ed23e160c401c14e41c40e9930f72697172b2c72933c2d2725a05e81e1f34ca')

prepare() {
  cd "${_cranname}"

  # Skip source code formatting check
  sed -i '/"source code formatting"/a skip("Do not check code formatting")' \
      tests/testthat/test-astyle.R

  # build against system sqlite and use system boost headers
  sed -i -e 's|PKG_LIBS = vendor/sqlite3/sqlite3.o|PKG_LIBS = -lsqlite3|' \
      -e 's| -Ivendor -Ivendor/extensions -Ivendor/sqlite3||' \
      src/Makevars
  sed -i 's|"vendor/sqlite3/sqlite3.h"|<sqlite3.h>|' src/{import-file.c,sqlite3-cpp.h}

  # Skip test that breaks with system sqlite
  sed -i '/"can read more than standard limit (#314)"/a skip("Does not work with system sqlite")' \
      tests/testthat/test-blob.R
}

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

check() {
  cd "${_cranname}/tests"
  R_LIBS="${srcdir}/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}
