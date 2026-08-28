# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rmixmod
_pkgver=2.1.12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('4d8553d6e70d3bf3c33feb7818baad9b'
         '98c555181a4b06b18ad6565b22a43dbe')
b2sums=('44a167d414411984e996a9782bca1bf4e012d5d6150749413eeb9db9148d52f5d2fc615ed615239bd0ee01c330b62ffecd5e9ebd003570d39b45b6c070077333'
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
