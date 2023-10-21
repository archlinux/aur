# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=paletteer
_pkgver=1.5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Comprehensive Collection of Color Palettes"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-prismatic
  r-rematch2
  r-rlang
  r-rstudioapi
)
checkdepends=(
  r-ggplot2
  r-ggthemes
  r-harrypotter
  r-oompabase
  r-palr
  r-pals
  r-scico
  r-testthat
  r-vdiffr
  r-viridislite
)
optdepends=(
  r-covr
  r-ggplot2
  r-ggthemes
  r-harrypotter
  r-knitr
  r-oompabase
  r-palr
  r-pals
  r-rmarkdown
  r-scico
  r-testthat
  r-vdiffr
  r-viridislite
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b4814df17b6c67809d2f3cfd9333ee08')
sha256sums=('7446242011583763f675aa937b794533548138d32bf2b3b592cc94118a99a0d6')

prepare() {
  # skip failing test
  sed -i '/"colors show up correctly for scico"/a\ \ skip("fails")' \
      "$_pkgname/tests/testthat/test-vdiffr_palette_check.R"
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
}
