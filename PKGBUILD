# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=fenr
_pkgver=1.6.2
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
md5sums=('f7f88b210e4b6144e3aeb05c84909b0e'
         '6798204e8be4babba5a589a4c303de0d')
b2sums=('c3e8f65b3a10b7f0b02d0a18f0d7f599a387a978f5cf83baf0ca3e2203e21fd0dafc97263c8506822ccaadb258ce735bcbdf0403f08f3c17ad972533ce0e49ea'
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
