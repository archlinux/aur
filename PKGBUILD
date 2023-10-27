# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowWorkspace
_pkgver=4.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Infrastructure for representing and interacting with gated and ungated cytometry data sets."
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(AGPL3)
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
md5sums=('e97cd561c6a61ae778261cb55f29af90'
         '6074f63c3e946d2bdb0688a866a6271d')
sha256sums=('9786e21e7a1b5935b04b6bde6c7fe6717fe49df03810e70d58a98f35865b9725'
            '5bd4f81d4c8e4596a6f16d3d8040228228f5235bb5fb3a1baf363aee44251cee')

prepare() {
  # use system hdf5 and skip failing tests
  patch -Np1 -i system-hdf5.patch
}

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
}
