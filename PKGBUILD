# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

_pkgname=flowCore
_pkgver=2.14.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('29b7b1bbecfbd24824f7ec4334a5e640'
         '219c62c718ad269fd5e832397a354e83')
b2sums=('0268edb3955c92eadc172349ff07b621fec598bef8b751b257ba70ab5be110ae2d0caf30a107d5220ac51f9f6a8c76897a2598946fc7a05328fa9d4e27bf604c'
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
