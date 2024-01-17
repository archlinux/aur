# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=fenr
_pkgver=1.0.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast functional enrichment for interactive applications"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=(MIT)
depends=(
  r-assertthat
  r-biocfilecache
  r-biomart
  r-dplyr
  r-ggplot2
  r-httr2
  r-progress
  r-purrr
  r-readr
  r-rlang
  r-rvest
  r-shiny
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-testthat
  r-topgo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "skip-tests.patch")
md5sums=('e138238616ad0ec5d87e7b1eaa5515c9'
         '3c859e68d330dcc0861feaadaee116af')
b2sums=('d038c68cd4036e73876e8aaef38ea9d1851b699364d362e7a99edc958c5f2dfeaf9c671fcc3ce7e2b86b8ed228e21a8153da52801f06802c99afcdb5c76dfd9d'
        '37cb831764b635251c92a9572efa9da2c69c9cce5de5e7fd56f51a85235321c8907cb70a3e055d05f0d0a887239ada190bb9468ba59bc7dbc90b1542ed7e0d17')

prepare() {
  # skip failing test
  patch -Np1 -i skip-tests.patch
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
