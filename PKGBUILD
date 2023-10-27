# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster.base
_pkgver=1.2.0
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
md5sums=('a9177fd32a21fcca23cd537ff375c879')
sha256sums=('c7b921ebe7a5cd4b993a68fe10f7bb19c2f94585bb62736ec5706e5a0d54dfec')

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
