# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=common
_pkgver=1.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Solutions for Common Problems in Base R"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(custom:CC0)
depends=(
  r-this.path
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-glue
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$pkgname-CC0.txt::https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt")
md5sums=('93fd171bfdba50b123433227761d7fd1'
         '65d3616852dbf7b1a6d4b53b00626032')
sha256sums=('8fc7025c15b5f26d0509e7c9f444030ea717318a0d7d913b8777fe7af3bab21b'
            'a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -Dm644 "$pkgname-CC0.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
