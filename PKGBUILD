# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RProtoBufLib
_pkgver=2.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="C++ headers and static libraries of Protocol buffers"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LicenseRef-RProtoBufLib')
depends=(
  protobuf
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "system-protobuf.patch")
md5sums=('7de7917bb81b2f16b83661795e3f13bd'
         'b86808f8853c60a736e5d47f89c7dddc')
b2sums=('55535d12461a13b2882faa240faf3ad6813b00186f6fa27fb32d0cecfd65da1f5e66e35c30b114d183ff46fa419b96bcaf19ea3e93889167f275ab95c631b7ba'
        '573c657def792c4441dd6c3d8adc507489598a9fe79ad4ae1f6727a47fba061d287d859910b56caa64d96381d018403861a7f7769d7b232ac8c0fbbf0ce1798e')

prepare() {
  # use system protobuf
  patch -Np1 -i system-protobuf.patch
  cd "$_pkgname"
  autoconf
  cd inst/include
  bash generate_pb_code.sh
}

build() {
  mkdir build
  SOVER="$_pkgver" R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

  # install shared library
  install -Dm755 -t "$pkgdir/usr/lib" "$_pkgname/src/libGatingSet.pb.so.$_pkgver"
  ln -s "libGatingSet.pb.so.$_pkgver" "$pkgdir/usr/lib/libGatingSet.pb.so"
}
