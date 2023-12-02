# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=yardstick
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tidy Characterizations of Model Performance"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  r-cli
  r-dplyr
  r-generics
  r-hardhat
  r-lifecycle
  r-rlang
  r-tibble
  r-tidyselect
  r-vctrs
)
checkdepends=(
  r-ggplot2
  r-testthat
  r-tidyr
)
optdepends=(
  r-covr
  r-crayon
  r-ggplot2
  r-knitr
  r-probably
  r-rmarkdown
  r-testthat
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$_pkgname-correct-expected-result.patch::https://github.com/tidymodels/yardstick/pull/429.patch")
md5sums=('d16dbb6e478b5e561cd6b6c29e0704c8'
         '386aabd0b1dfcc7ccf4e9b3109ee6030')
sha256sums=('ebf113ad1d6554dd5d17181148a8c9e51166d4fa579e9540756d01ef61b71d2b'
            '2c8c2afb9ed2ef44244d9b1a2b2433758cb39fb68fda71f7c4ff093661f7d2d4')

prepare() {
  # fix tests
  patch -Np1 -d "$_pkgname" < "$_pkgname-correct-expected-result.patch"
}

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
