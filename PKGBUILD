# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowWorkspace
_pkgver=4.18.1
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
md5sums=('3a0c74f3cf5bbe37be94da56e0380029'
         'd83db00432ba74621da54d24fce960fc')
b2sums=('74f04792804f86d77030f3a76ff07a33c8d99d898e843c4548d5c7d485d4f9b22e670987ffaf0f64066a6fab2de9f469dab1587f2b6533997373f5ea4b046038'
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
