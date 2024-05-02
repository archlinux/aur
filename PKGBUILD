# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowWorkspace
_pkgver=4.16.0
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
md5sums=('319f70fb52639e9bf0ff0cc634fde9b6'
         'd83db00432ba74621da54d24fce960fc')
b2sums=('a567fe3087b70eee29d327dda51257bbaf5eb11d54fc9485f886b99e83d109c21fe1d09169021adf77738a8ea0fd742c82c00aae14d22b7b6502fae2535d3c22'
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
