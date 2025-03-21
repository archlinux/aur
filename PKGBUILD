# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CytoML
_pkgver=2.18.3
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
md5sums=('535d1ca22a88bb80510195531b2a2381'
         'c830342f553f0cfc7ac954ec93b429c2')
b2sums=('11a9f8c15e2b0ca643298536032b02dd9b1e982dbd734bdc68f5e452216c83fb31a0185d9c75c0f125917377b5064f073ec93482400cd9d2872ea3fcc80b9d22'
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
