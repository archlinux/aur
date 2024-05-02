# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChemmineR
_pkgver=3.56.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cheminformatics Toolkit for R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-base64enc
  r-biocgenerics
  r-dbi
  r-digest
  r-dt
  r-ggplot2
  r-gridextra
  r-jsonlite
  r-png
  r-rcpp
  r-rcurl
  r-rjson
  r-rsvg
  r-stringi
)
makedepends=(
  r-bh
  swig
)
checkdepends=(
  r-rsqlite
  r-runit
  r-snow
)
optdepends=(
  r-bibtex
  r-biocmanager
  r-biocstyle
  r-chemminedrugs
  r-fmcsr
  r-gplots
  r-knitcitations
  r-knitr
  r-knitrbootstrap
  r-rmarkdown
  r-rpostgresql
  r-rsqlite
  r-scatterplot3d
  r-snow
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5da39362488d8e62255105201e0b88c3')
b2sums=('14453dec60262143ab064bc5215ce51a13d842117bf9919d4e95e78cb76faa67a62c30e201e8199ee65260e8b1e4e74c847beecb3b0bf31ddf35c9907cb86f0c')

build() {
  # generate R bindings
  cd "$_pkgname"
  ./runSwig.sh
  cd ..

  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
