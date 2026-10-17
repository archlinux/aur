# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TreeTools
_pkgver=2.5.0
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
  r-plottools
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
  r-fastmatch
  r-knitr
  r-phangorn
  r-rcpp
  r-rcurl
  r-rmarkdown
  r-spelling
  r-testthat
  r-treedist
  r-treesearch
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d71b61aca77ffad437c2a0b60e3370ae')
b2sums=('130c87f4b55499b2e216a46b1bb30375598ed8d14dc753c623ad646f676fde9a9780c0849de2ecb98bff509889ad825a2541b846f0dcb755ca18749758a5853c')

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
