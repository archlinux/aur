# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Pranav K Anupam <pranavanupam@yahoo.com>

_pkgname=dtplyr
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Data Table Back-End for 'dplyr'"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  r-cli
  r-data.table
  r-dplyr
  r-glue
  r-lifecycle
  r-rlang
  r-tibble
  r-tidyselect
  r-vctrs
)
checkdepends=(
  r-testthat
  r-tidyr
)
optdepends=(
  r-bench
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
  r-tidyr
  r-waldo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d1cc10d74af58ac44a99392237aca50e')
sha256sums=('a5a9689a640b8bd1274519af220c33deaa3919654acac4ebdff1ff365cc8d6e5')

prepare() {
  # fix snapshot test
  sed -i 's/\.\.\. with 26 more rows/i 26 more rows/' \
      "$_pkgname/tests/testthat/_snaps/step.md"
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
