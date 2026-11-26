# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cytolib
_pkgver=2.26.0
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
md5sums=('898451e116f815a0612ea4983fed8126'
         '27ac0caa7d8082e707350be3de8d8222')
b2sums=('42fa51b9258a6f0ec3e42d74f7af4cfd87ba06317371efdddf69205f7dd73b4fe0343ae75b59d659beff663c528f9ad6683f6e9facd1ffc0de9c23aaa24e4898'
        '5e6674448d7e45804831d63c7adcb79921eda90c1e396fafe667dd2efb3356e1809cd7602d4cb6b74f47c4933980fd6052d7a5955d78892a1def3b2b2fafa27c')

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
