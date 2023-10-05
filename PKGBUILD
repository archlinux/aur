# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rmixmod
_pkgver=2.1.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Classification with Mixture Modelling"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
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
md5sums=('6e02da6f0e72ace0f2c6c9d761c6d67c'
         '98c555181a4b06b18ad6565b22a43dbe')
sha256sums=('d87eeb1de611ce0e421141a3b3d11cae819d327fbc510314a820ddf982a09453'
            '2849f3da407a8d3fc6d081274d66af67f63879e9976fa1997bebf07112147cf5')

prepare() {
  # fix compilation with libxml++
  patch -Np1 -i fix-libxmlxx.patch
}

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build \
      --configure-vars=RMIXMOD_WITH_XML=1 \
      --configure-vars=RMIXMOD_WITH_OMP=1
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
