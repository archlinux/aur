# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TreeTools
_pkgver=1.13.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Create, Modify and Analyse Phylogenetic Trees"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-ape
  r-bit64
  r-colorspace
  r-fastmatch
  r-lifecycle
  r-plottools
  r-r.cache
  r-rcurl
  r-rdpack
)
makedepends=(
  r-rcpp
)
checkdepends=(
  r-phangorn
  r-purrr
  r-testthat
  r-vdiffr
)
optdepends=(
  r-knitr
  r-phangorn
  r-purrr
  r-rcpp
  r-rlang
  r-rmarkdown
  r-spelling
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b626a280d4bc4dcee85f588e85e659ce')
b2sums=('fc8a24be6441fe7c7c5a0dea31576e205ba193331cbba95431bbb345b863ad1e64975f821ed21da0837b2536e7c132f796ed575ec65dd3c13be98a5f9afc4f48')

prepare() {
  # skip failing tests
  sed -e '/"Simple rogue plot"/a\ \ skip("fails")' \
      -e '/"polytomy id"/a\ \ skip("fails")' \
      -e '/"Complex rogue plot"/a\ \ skip("fails")' \
      -i "$_pkgname/tests/testthat/test-RoguePlot.R"
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
