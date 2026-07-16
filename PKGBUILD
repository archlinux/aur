# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

_pkgname=flowCore
_pkgver=2.24.0
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
md5sums=('ed0cbbf0bce9f10ed53f662b4f7ab3d6'
         'fc433793c9af520e6dcf2d9a5e40af4b')
b2sums=('a63af0be773b5e3d9968164a52b94809eed41395912bae828d6716aa7fbbb204dac243317e96b2cf1129805a91a2dce048071c2f232bca5b39169b628fbd8c9d'
        'cf6f8d8d648cdd1cbfd0b37ab50e305b56e6fb1e0aa1cae15f56d6f714c51e4003e671611c77607396ea41dd5d282591bcf2e4483efa0d72c10d44042ab2f6b8')

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
