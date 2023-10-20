# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RProtoBufLib
_pkgver=2.12.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="C++ headers and static libraries of Protocol buffers"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(BSD)
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
md5sums=('d9018c7ced22e3684d963670007e3325'
         'b86808f8853c60a736e5d47f89c7dddc')
sha256sums=('b5c1c2d5ea6284ec33bda7af86fa99554687451287aabbacf91ed325a3ecf624'
            '950a768ca57887b7045ce8de1839bab67771b97c06b8007c09c9b50e8c8848b8')

prepare() {
  # use system protobuf
  patch -Np1 -i system-protobuf.patch
  cd "$_pkgname"
  autoconf
  cd inst/include
  bash generate_pb_code.sh
}

build() {
  mkdir -p build
  SOVER="$_pkgver" R CMD INSTALL "$_pkgname" -l build
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
