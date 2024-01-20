# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CytoML
_pkgver=2.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="A GatingML Interface for Cross Platform Cytometry Data Sharing"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('AGPL-3.0-only')
depends=(
  boost-libs
  libxml2
  r-biobase
  r-cytolib
  r-data.table
  r-dplyr
  r-flowcore
  r-flowworkspace
  r-ggcyto
  r-graph
  r-jsonlite
  r-opencyto
  r-rbgl
  r-rgraphviz
  r-tibble
  r-xml
  r-yaml
)
makedepends=(
  boost
  r-bh
  r-cpp11
  r-rhdf5lib
  r-rprotobuflib
)
checkdepends=(
  r-flowworkspacedata
  r-testthat
)
optdepends=(
  r-flowworkspacedata
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "system-hdf5.patch")
md5sums=('4b0060416cdeef7876cb9aaeb81dbaf7'
         'c830342f553f0cfc7ac954ec93b429c2')
b2sums=('60eaf5dd32f6c2305b85c90c98100ec4d372a60fd5d3ed8d5d91c34c5cee76c4eccef11ce090dabb6c17243bcce3350ab0985889c0e940c4e58c0f636b8d190d'
        '841b451423480c8a53debd7b63f5d83e27ffb064e2eff8051f284560f658cac1826fbf0172fad09aa3810f78e7a4cfd3ad41bdaf3fc28ec4c8d76ed2f418e666')

prepare() {
  # use system hdf5
  patch -Np1 -i system-hdf5.patch
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
}
