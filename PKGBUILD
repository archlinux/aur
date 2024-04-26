# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

_pkgname=flowCore
_pkgver=2.14.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
        "fix-printf.patch"
        "fix-build.patch")
md5sums=('dcf8d4670f2a8f3af6f10328a2bbe941'
         '6b3e7e965d1305b7035d3073119e5b42'
         '219c62c718ad269fd5e832397a354e83')
b2sums=('17b804fb3f269734eed0ffabb416951e4959f747530584a51e74388fdad449923d15ab059c3fe990f77d978ccd2b65931ed24e5533dc2d0326a29dedfe1f8267'
        '6e4036981d60a5a037bc04176bcc3fd3a7b0a1a34dd81b09addd85dbcf0075934206dfa4c8bef9b9fb7b2d5f855c34fc3fcaeecbb76214a8d08f3cd7f9cde591'
        '6bc038d5c185faa94b6a85d6f884cdefd3e614c26c4e5240cbb217179385d26eec40b329e14ab6d4d9bae2e60d1b49faedc6fffe9e36f271d33c2db92b10d447')

prepare() {
  # fix format string errors
  patch -Np1 -i fix-printf.patch

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
