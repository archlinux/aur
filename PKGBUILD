# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=Rhisat2
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Wrapper for HISAT2 Aligner"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-genomicranges
  r-sgseq
  r-txdbmaker
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-build.patch")
md5sums=('40eeced68deeadf6506e97eb53e4a831'
         '3f45bc291d0db4e626db5336680b2f73')
b2sums=('f289e764d5085458a8248154e2aa8bc790c76c3e23866153757ba5e86a157b62b1d20f65732952a6a7fd0a8098b3c8289afcdd043c54fb691e69673fc07c35e0'
        'f3d4cc8719124604b7d295c6143d38187901cbca50da949f4c49edac0d43e818cde3ab03cc05ad77425091db705979b1d9b381c751c0fada90b48796b54fee2c')

prepare() {
  # fix compiler flags
  patch -Np1 -i fix-build.patch
}

build() {
  mkdir build
  # parallel compilation fails
  MAKEFLAGS+=" -j1"
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
