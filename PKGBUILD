# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Rarr
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Read Zarr Files in R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
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
b2sums=('1ed0ea1b9eb24b60fcbebcd56ebb49f149a82b3d3218d0f86214537836c051f07cfcceac84ac53711005249cbd5c157b55371c629510de7457f9054b1dee9d1c'
        '137df7ed9d8504b913aebd2588a8d88651d6a46bb8985981f0aa3032244372fd163b48c691b1fd2918d8f9aa3834b2538f6a4901bb01538fa8a0875e0f771353')

prepare() {
  cd "$_pkgname"
  # use system blosc and lz4
  patch -Np1 -i ../system-libs.patch
  autoconf
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
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
