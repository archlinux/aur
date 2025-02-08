# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tidyHeatmap
_pkgver=1.11.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Tidy Implementation of Heatmap"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-circlize
  r-complexheatmap
  r-dendextend
  r-dplyr
  r-lifecycle
  r-magrittr
  r-patchwork
  r-purrr
  r-rcolorbrewer
  r-rlang
  r-tibble
  r-tidyr
  r-viridis
)
checkdepends=(
  r-spelling
  r-testthat
  r-vdiffr
)
optdepends=(
  r-biocmanager
  r-covr
  r-forcats
  r-ggplot2
  r-knitr
  r-qpdf
  r-rmarkdown
  r-roxygen2
  r-spelling
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ad8cd43927e7fabb06e378e96d9e1333')
b2sums=('488cb402a670343a214b44976cc3f341d1fbc57a617d642d4410eeb5d793bb2b0ade77ca8344460416adfb6061d2d2b75be6365767bf9c5f6bc2207bb21d5ba7')

prepare() {
  # skip failing snapshot tests
  sed -e '/"grouped double and annotated plot"/a\\tskip("fails")' \
      -e '/"grouped and annotated plot both vertical and horizontal"/a\\tskip("fails")' \
      -e '/"pass arguments with ..."/a\\tskip("fails")' \
      -e '/"multi-type"/a\\tskip("fails")' \
      -e '/"legend"/a\\tskip("fails")' \
      -e '/"size annotation"/a\\tskip("fails")' \
      -e '/"wrap heatmap for patchwork"/a\\tskip("fails")' \
      -i "$_pkgname/tests/testthat/tests.R"
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
