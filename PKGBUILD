# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowWorkspace
_pkgver=4.14.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Infrastructure for representing and interacting with gated and ungated cytometry data sets"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('AGPL-3.0-only')
depends=(
  boost-libs
  hdf5
  r-biobase
  r-biocgenerics
  r-cytolib
  r-data.table
  r-delayedarray
  r-dplyr
  r-flowcore
  r-ggplot2
  r-graph
  r-matrixstats
  r-ncdfflow
  r-rbgl
  r-rgraphviz
  r-rprotobuflib
  r-s4vectors
  r-scales
  r-xml
)
makedepends=(
  boost
  r-bh
  r-cpp11
  r-rhdf5lib
)
checkdepends=(
  r-flowworkspacedata
  r-testthat
)
optdepends=(
  r-cytoml
  r-flowworkspacedata
  r-ggcyto
  r-knitr
  r-opencyto
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "system-hdf5.patch")
md5sums=('84495f076b13f32e0f98817c8ff03ede'
         'd83db00432ba74621da54d24fce960fc')
b2sums=('7d241283522c1eaab9e5124b73504d83f76de210d42dccebcdc292f9a5cce78c1701ef89d33021f9aaf416d4a192b296b920cf75fcd8b768b1a345655737142c'
        '5f693100c9198981f8ff28aca945499054570fb5957ae22c908f2e4c19cf79704e5961589632e6568a5e62229b678ab748c02333919a18193b773c1ed602bbaf')

prepare() {
  # use system hdf5 and skip failing tests
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
