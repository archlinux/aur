# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rmixmod
_pkgver=2.1.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Classification with Mixture Modelling"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  glibmm
  libxml++2.6
  r-rcpp
)
makedepends=(
  r-rcppeigen
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-libxmlxx.patch")
md5sums=('38db0fd33a09fc2496c9e0ae66b76547'
         '98c555181a4b06b18ad6565b22a43dbe')
b2sums=('e3f8f2de5c0446659d8791c1bca064c6231d4c52c4393d19b05ed949e71e291f3018f52076c50e3064347b2c81eb050eccd2afd75a1ff880376fc6ddc5a11cb8'
        'a8af70ea1a5562d51941f5a2f6997fba8f3787f1cfd6454a1fb1c70378341df5c9fe7cd0b55353d27f734818000f987b45ae394645b5e7a828d7d3b84c10d57d')

prepare() {
  # fix compilation with libxml++
  patch -Np1 -i fix-libxmlxx.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname" \
      --configure-vars=RMIXMOD_WITH_XML=1 \
      --configure-vars=RMIXMOD_WITH_OMP=1
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
