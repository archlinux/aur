# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChemmineR
_pkgver=3.54.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-build.patch")
md5sums=('8dd1886811bdc4ac23c24fad60a9b238'
         'baf06ba1ce78e6c96fc054079c2c3a24')
b2sums=('ff0535357fe4fbb4578e5ab8b7d5211b7ec98afc6e95df83e857ff91bfa6ca22ea3161d4b8f680537f8334c2f05ef041f913f25fb0272073e3a0f4a1c0f08e27'
        '81d3ce9b04dda305ac369c0a02cf2dc60e3ddb0f277af4a1d61aa9cc15878835e57f2d0a39aef0c2228fd7003337c424681d86318dfb8e9ae1bc9f3fc2e17337')

build() {
  # generate R bindings
  cd "$_pkgname"
  ./runSwig.sh
  # fix format string errors in the generated source
  patch -Np1 -i ../fix-build.patch
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
