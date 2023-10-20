# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hrbrthemes
_pkgver=0.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Additional Themes, Theme Components and Utilities for 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  r-extrafont
  r-gdtools
  r-ggplot2
  r-htmltools
  r-knitr
  r-magrittr
  r-rmarkdown
  r-scales
)
checkdepends=(
  r-hunspell
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
md5sums=('164d952f9627188cff499edd1cce9c5c')
sha256sums=('ecfe33ff0907f141c84587376274d2c8249f03938f72e7a5676d945b1630f014')

prepare() {
  # skip test since importing fonts with r-extrafont doesn't work
  sed -i '/^  invisible(import_roboto_condensed/i\ \ skip("extrafont import does not work")' \
      "$_pkgname/tests/testthat/test-hrbrthemes.R"
}

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
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
