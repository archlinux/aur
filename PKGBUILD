# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: frichtlm <frichtlm@gmail.com>

_pkgname=tidyr
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tidy Messy Data"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cli
  r-dplyr
  r-glue
  r-lifecycle
  r-magrittr
  r-purrr
  r-rlang
  r-stringr
  r-tibble
  r-tidyselect
  r-vctrs
)
makedepends=(
  r-cpp11
)
checkdepends=(
  r-data.table
  r-testthat
)
optdepends=(
  r-covr
  r-data.table
  r-knitr
  r-readr
  r-repurrrsive
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0491d9d3359af7baf8ad9003ce44aa1d')
b2sums=('43ec7fca79d137205847ae837a20f6ed2be8d4440cde29f6ff11cac0df35a1fbdb6d55d1365303819d25f5333819c9541a4e0a006e39e22cfa665c0f9d8fbf76')

prepare() {
  cd "$_pkgname/tests/testthat"
  # skip broken snapshot tests
  sed -i '/"after must be integer or character"/a\ \ skip("broken snapshot")' test-append.R
  sed -i '/"input validation catches problems"/a\ \ skip("broken snapshot")' test-hoist.R
  sed -i '/"`pivot_longer()` catches unused input passed through the dots"/a\ \ skip("broken snapshot")' test-pivot-long.R
  sed -i '/"separate_wider_position() validates its inputs"/a\ \ skip("broken snapshot")' test-separate-wider.R
  sed -i '/"`transform` is validated"/a\ \ skip("broken snapshot")' test-unnest-helper.R
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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
