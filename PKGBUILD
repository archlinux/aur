# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=common
_pkgver=1.0.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Solutions for Common Problems in Base R"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(custom:CC0)
depends=(
  r
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-box
  r-glue
  r-knitr
  r-rmarkdown
  r-rstudioapi
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$pkgname-CC0.txt::https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt")
md5sums=('65986ad1d3629d5f114e041f6f3bd033'
         '65d3616852dbf7b1a6d4b53b00626032')
sha256sums=('03a73b7a78aef4c6263251a396c343b80447c2d6ad024b9f769b43f3e36b4f50'
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
