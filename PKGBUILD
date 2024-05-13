# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=WriteXLS
_pkgver=6.6.0
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
md5sums=('b7f15ab4592d4887d3d54d9f625554c9')
b2sums=('a67e4385c30ebb281c4e4bab1c89967b861bd939bc2f1384f6ff18e9f68b454cdb8d15b39428cfc819a9d10ba80f81f85d2c2ea636e6a40cbf353c92d1706594')

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
