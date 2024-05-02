# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SharedObject
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Sharing R objects across multiple R processes without memory duplication"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocgenerics
  r-rcpp
)
makedepends=(
  r-bh
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$_pkgname-fix-build.patch::https://github.com/Jiefei-Wang/SharedObject/pull/17.patch")
md5sums=('87df87d1ae41a153d960c0c7b9428d9b'
         '2d31d0afa3d7a9d170184218df260995')
b2sums=('3d0f326acbb787ae2399d9a4e3acc649a0b72fa03b3921dcb24a3a79c928b880a9c96a0030931be06c7ad11d4827d3ffc03c0a971eeaac0d4f142a464ea47aad'
        'caf4cf7035f69013402ff6cd3058bf504fb097e9c9c50e64b117e949f68ef62933dce4c560085e82337fec01eed00125fbdebf16debc4c72c6f2308044ebad6f')

prepare() {
  # fix build
  patch -Np1 -d "$_pkgname" < "$_pkgname-fix-build.patch"
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
