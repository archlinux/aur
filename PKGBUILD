# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=WriteXLS
_pkgver=6.5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('b79c9e45770f56e2b87530764c12334c')
b2sums=('3caad60a9b707181a150e5386286d8ea5dd0e88a0ebcc0af78d588adb6bb1dae804acf641ad8f6111efed8955fff7ded81d2231e1e567f6d10b8a1dbae4c5f1f')

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
