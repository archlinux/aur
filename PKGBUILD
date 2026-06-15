# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hrbrthemes
_pkgver=0.9.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Additional Themes, Theme Components and Utilities for 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-ggplot2
  r-magrittr
  r-scales
)
checkdepends=(
  r-hunspell
  r-stringi
  r-testthat
  r-vdiffr
)
optdepends=(
  r-clipr
  r-dplyr
  r-gcookbook
  r-gridextra
  r-hunspell
  r-stringi
  r-svglite
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('33ca2f26236bfb7f9b02e72a33937bd6')
b2sums=('1afc02f6c7c511cc84ebacbbb60fc83dbebd4db73fb52cbae1c4cddc3188e0f8c78c4a8f7cef1323f33fc99785c36f39248b53d78109b5c1e2cd0813e3f19764')

prepare() {
  # skip test since importing fonts with r-extrafont doesn't work
  sed -i '/^  invisible(import_roboto_condensed/i\ \ skip("extrafont import does not work")' \
      "$_pkgname/tests/testthat/test-hrbrthemes.R"
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla test-all.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
