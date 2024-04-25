# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gdsfmt
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
        "fix-build.patch"
        "system-libs.patch")
md5sums=('8851c188356c12f7e99488ceb4daeca8'
         '5e5650ffad20c213b2e03b7d7b480e2d'
         'bffd05eba8706aacc469c69a3b0eeada')
b2sums=('a0de53a5abcf04de12683d73c0bca9b73aa452f4e651de2086bab5ebb1eb0c1e12c3857f96bffb07880a29f97a189662599f553deeadf5d1a6b4685caf42d87b'
        'a8267f7e2e2e9c7b0952181bfff0c51e459ff2e0b35927e5c3b4ca5781a7e769b4fe887049d773438c9dc5a08b357abfa97ef4dbe3ff4e57a5f6b1fb00ce4030'
        '808ea6a968885e4828813829ce91499772d32368bbe29c4833768ac41cee454717b47e1e77b84cb8c9548b843665ace13f60211494ddc309a0e012b5dde41ed4')

prepare() {
  # fix format string errors
  patch -Np1 -i fix-build.patch

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
