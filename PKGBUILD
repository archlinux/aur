# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=WriteXLS
_pkgver=6.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cross-Platform Perl Based R Function to Create Excel 2003 (XLS) and Excel 2007 (XLSX) Files"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  perl-archive-zip
  perl-parse-recdescent
  perl-text-csv
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c6b7c215983a8b63f28a10b2541c33e3')
b2sums=('7dfae3f9f0914460eeb704da9b5e0b7c160063194d182fe01ab768a3e2b7a7104075714566a508c964bc7363c3bad1542e91f79a62ef8a08fe8856224c63edf0')

prepare() {
  # remove some vendored perl modules, use system provided versions instead
  cd "$_pkgname/inst/Perl"
  rm -r Archive File Getopt Parse Text
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  # test that all required perl modules are available
  R_LIBS="$srcdir/build" Rscript --vanilla -e "stopifnot(WriteXLS::testPerl())"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
