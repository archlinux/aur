# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChemmineR
_pkgver=3.60.0
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
md5sums=('7f809d1bc600faa86d9e11965efea058')
b2sums=('5ed5481355a73b124b785f31a79436e99d8c046957c5fa7ac26c39873b1d8d8c8f706d7bd6b496d1ead937faedcf930bf85f645cb84b892981c0794bf062d10e')

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
