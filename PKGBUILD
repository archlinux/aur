# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gdsfmt
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Interface to CoreArray Genomic Data Structure (GDS) Files"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(LGPL3)
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
md5sums=('8851c188356c12f7e99488ceb4daeca8'
         'bffd05eba8706aacc469c69a3b0eeada')
sha256sums=('f5d27de87206a250ee88408acfb7cd4058d90677c3d2c86696710e51388f0f0f'
            'a30cf43b5d8f07f19e88cc26fc2ccf6d88ab491e21ab3eb5b656d5258272af85')

prepare() {
  # use system lz4, xz and zlib
  patch -Np1 -i system-libs.patch
}

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
