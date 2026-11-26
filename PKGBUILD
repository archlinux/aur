# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gdsfmt
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Interface to CoreArray Genomic Data Structure (GDS) Files"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-only')
depends=(
  lz4
  r
  xz
  zlib
)
checkdepends=(
  r-biocgenerics
  r-digest
  r-runit
)
optdepends=(
  r-biocgenerics
  r-crayon
  r-digest
  r-knitr
  r-markdown
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "system-libs.patch")
md5sums=('74ec41369526ee22f1007e0a70cc526e'
         'bffd05eba8706aacc469c69a3b0eeada')
b2sums=('0e0db9e0d2626b827e3f3330339034a63a3ad4ed96b966951d71ba85dee4edd624003e2fe7a073d751b32773659fff8fd37ddac8ea277673d66e9abce9dfad60'
        '808ea6a968885e4828813829ce91499772d32368bbe29c4833768ac41cee454717b47e1e77b84cb8c9548b843665ace13f60211494ddc309a0e012b5dde41ed4')

prepare() {
  # use system lz4, xz and zlib
  patch -Np1 -i system-libs.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
