# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cytolib
_pkgver=2.18.2
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
md5sums=('78742ee2363cda797d9f263971fbc38f'
         '9bd107e22883f8ae7c72f8fc3fca9c96')
b2sums=('2520690419692dec299c891ac30f573bf412d9cd05679af11a4448c6580ffb41d41499ab5f59d24ed786b70a6c3da8ee1e9d5eea5da7457739df95808134d83b'
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
