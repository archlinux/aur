# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=netboost
_pkgver=2.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Network Analysis Supported by Boosting"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-colorspace
  r-dynamictreecut
  r-impute
  r-r.utils
  r-rcpp
  r-rcppparallel
  r-wgcna
  bash
  gzip
  make
  onetbb
  perl
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-build.patch")
md5sums=('4e319e424da454c8584b1cfecaeb728b'
         '8ec6c48c11194032999b97b498934753')
b2sums=('862ffe3df499991a13f2d3d6a072e4134066cde5900656108b0283163db44f808c80b615174f638bb3c3826eaf9ac77f23ec170ac3aa51f511dddc66bd5077ee'
        'e607da2818fcc96d110e579ddbf7ac221aea127fbc730a1d6ac5946d608915fe3ef4af39e7b678a08c165c55d629b44df0147ecf6b758f1ff7a4715421374eab')

prepare() {
  # disable CPU feature detection, fix build flags
  patch -Np1 -i fix-build.patch
  cd "$_pkgname"
  autoconf
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
