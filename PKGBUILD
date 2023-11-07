# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster.base
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Save Bioconductor Objects To File"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
depends=(
  r-alabaster.schemas
  r-jsonlite
  r-jsonvalidate
  r-rcpp
  r-rhdf5
  r-s4vectors
  zlib
)
makedepends=(
  r-rhdf5lib
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-digest
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2d6215dfe9b8412438f9b05b54be2331')
sha256sums=('a300d1c7476257b52b5d9b6a8b5d47a4e0b03c178a3de965223ba182e061ffee')

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
