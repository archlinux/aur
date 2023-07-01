# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Pranav K Anupam <pranavanupam@yahoo.com>
# Contributor: Alex Branham <branham@utexas.edu>

_pkgname=reprex
_pkgver=2.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Prepare Reproducible Example Code via the Clipboard"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  pandoc
  r-callr
  r-cli
  r-clipr
  r-fs
  r-glue
  r-knitr
  r-lifecycle
  r-rlang
  r-rmarkdown
  r-rstudioapi
  r-withr
)
checkdepends=(
  r-mockr
  r-styler
  r-testthat
)
optdepends=(
  r-covr
  r-fortunes
  r-miniui
  r-mockr
  r-rprojroot
  r-sessioninfo
  r-shiny
  r-spelling
  r-styler
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dfda2989d9317160661dcec6a8f2fed8')
sha256sums=('a85b16e26112364a65c886efea050df08c17aadf1411fd14ec27d9ef13e87092')

prepare() {
  # fix snapshot test
  sed -e 's/Please use /i Please use /' \
      -e 's/Use /i Use /' \
      -e 's/\*/i/' \
      -e 's/Working directory /i Working directory /' \
      -i "$_pkgname/tests/testthat/_snaps/utils-io.md"
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
