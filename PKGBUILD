# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rmixmod
_pkgver=2.1.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('38db0fd33a09fc2496c9e0ae66b76547'
         '98c555181a4b06b18ad6565b22a43dbe')
sha256sums=('96d592c36a456ab744b5e885dbbc929e4d1d2a5f4d8489c9c224fe353f0af189'
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
