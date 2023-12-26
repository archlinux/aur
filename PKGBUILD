# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=WriteXLS
_pkgver=6.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Cross-Platform Perl Based R Function to Create Excel 2003 (XLS) and Excel 2007 (XLSX) Files"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  perl-archive-zip
  perl-parse-recdescent
  perl-text-csv
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b62412fab12ed7ffa5f47ed4238cdb15')
b2sums=('848296aa855563889e3473c4b00e9958d44667611114e39010d504b67787db9c5050bac51fefc65e802f67642b4add53b4170e97b136fb8caa07a90752eb73dc')

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
