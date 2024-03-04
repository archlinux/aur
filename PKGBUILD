# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hrbrthemes
_pkgver=0.8.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Additional Themes, Theme Components and Utilities for 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-extrafont
  r-gdtools
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
md5sums=('2c239ee48ed2bf410b7e99f8c746c7ef')
b2sums=('375f8330c487c7cc7099519f725ef6f8c5f7c1bda3fc089c05147f1d0b68524ca1219a327a0a217e638c7c8a0e3a6d7ba10604305b85bce9a55c47a930a17eeb')

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
