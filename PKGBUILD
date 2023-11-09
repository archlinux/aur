# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Rarr
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Read Zarr Files in R"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
depends=(
  blosc
  lz4
  r-httr
  r-jsonlite
  r-paws.storage
  r-r.utils
  r-stringr
)
checkdepends=(
  r-mockery
  r-tinytest
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-mockery
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "system-libs.patch")
md5sums=('94af864ae3de3557840993a429944ea2'
         '83d4df5360e4cf2088753078dc2970b6')
sha256sums=('997592c52d8d0aa11680d0f40df11765d57e65a1f9c5e61671ff4513d31d4cfb'
            '023d93a3ac3c339eb00c1e79f8ac54f48fac514f43f2246b5aa17014551974f2')

prepare() {
  cd "$_pkgname"
  # use system blosc and lz4
  patch -Np1 -i ../system-libs.patch
  autoconf
}

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla tinytest.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
