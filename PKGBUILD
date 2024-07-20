# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=WriteXLS
_pkgver=6.7.0
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
md5sums=('8278decde94e06032875bd6b72b2727c')
b2sums=('e0158d95c37c48a8c5e78ba98d72ca012cff0afb43967ebdd880a172f8f1998ccf353acca86b82325247771bdf809fae7731ec62e548c969f6c9d6e07e128310')

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
