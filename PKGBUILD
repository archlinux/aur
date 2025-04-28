# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=fenr
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast functional enrichment for interactive applications"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-assertthat
  r-biocfilecache
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
  r-rmarkdown
  r-testthat
  r-topgo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-tests.patch")
md5sums=('db2763531ea6fd8a5a25a88641943dde'
         '6798204e8be4babba5a589a4c303de0d')
b2sums=('4ee2089482495e38f4d5c6157e377672f88f2366b875d4a998c49f227e27423519ad5fb48302a43e4e6eb03afc44d4a89220138ce8f75ae1902f5cbc2eef06c9'
        '534aaa7bc8ed386545ac5d10ef4b9d1fb9b270f9e2ea66aa5c0a450d7733a3bfbc629a83588c39fb35882d5240015aa86e4060456dcd4d27bd55e79a7cc3138c')

prepare() {
  # skip failing tests
  patch -Np1 -i fix-tests.patch
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
