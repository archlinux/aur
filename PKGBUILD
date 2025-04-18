# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CytoML
_pkgver=2.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('2c8957505502158ae7a5265db3fc6fdb'
         'c830342f553f0cfc7ac954ec93b429c2')
b2sums=('93a834f7ca4a3e62000577f9865b27cf1f14e90ec8caa95717e5cb0a244f72f12b8bf39bdcc4444e7cfcfbb1ff58dcb986c7146a106ea2469e81ba5dd85eb069'
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
