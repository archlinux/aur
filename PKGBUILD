# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cytolib
_pkgver=2.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="C++ infrastructure for representing and interacting with the gated cytometry data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('AGPL-3.0-only')
depends=(
  boost-libs
  hdf5
  lapack
  protobuf
  r-rprotobuflib
)
makedepends=(
  boost
  r-bh
  r-rhdf5lib
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "shared-cytolib.patch")
md5sums=('315a10e5ab4beca630554a17eaf56853'
         '9bd107e22883f8ae7c72f8fc3fca9c96')
b2sums=('905f87f4573acd9588b401a1a9c5898b381540e72ba31e875df12ceb6530c3d6ba0dbe9fd3ed7f92d94f40742a24062d9aef6ef36837742751e3207444ae3362'
        '1d838f25582856c2a7ba811999ae92808265720e8bd6079b4396d3722bab3f445ec7e70722badac2d5617439784a279abacda788f66e49906b35120f12037bcb')

prepare() {
  # build cytolib as a shared library
  patch -Np1 -i shared-cytolib.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  # install shared library
  install -Dm755 -t "$pkgdir/usr/lib" "$_pkgname/src/libcytolib.so.$_pkgver"
  ln -s "libcytolib.so.$_pkgver" "$pkgdir/usr/lib/libcytolib.so"
}
