# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

_pkgname=flowCore
_pkgver=2.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Basic structures for flow cytometry data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
  r-biocgenerics
  r-cytolib
  r-matrixstats
  r-rcpp
  r-s4vectors
)
makedepends=(
  r-bh
  r-cpp11
  r-rprotobuflib
)
checkdepends=(
  r-flowworkspacedata
  r-testthat
)
optdepends=(
  r-flowstats
  r-flowviz
  r-flowworkspace
  r-flowworkspacedata
  r-ggcyto
  r-gridextra
  r-knitr
  r-opencyto
  r-rgraphviz
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-build.patch")
md5sums=('3b0696fd3fc45a87531ab3503be00277'
         '219c62c718ad269fd5e832397a354e83')
b2sums=('5e59c1efdbb268d47a8fed0b11509925ee86b77eb7d9f016cc82c66659c63eaa23cfcdb1e73f69d5c79771d62adfc1d3c52572edd4a5e69cc7206ea2d5744fa3'
        '6bc038d5c185faa94b6a85d6f884cdefd3e614c26c4e5240cbb217179385d26eec40b329e14ab6d4d9bae2e60d1b49faedc6fffe9e36f271d33c2db92b10d447')

prepare() {
  # fix build and remove unnecessary import from tests
  patch -Np1 -i fix-build.patch
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
