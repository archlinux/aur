# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

_pkgname=flowCore
_pkgver=2.12.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="flowCore: Basic structures for flow cytometry data"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
md5sums=('92bb3f604d43aef47d1b8d4ecbb5f28d'
         '219c62c718ad269fd5e832397a354e83')
sha256sums=('1064a2941dbca4a25ff129ca8d62c9341b545aa070d6221987b2edeac3d57dfc'
            '73e075b8ce2f0e9f3dea2e8778c6174586b71fb3c2b64c6ded4e5fb50ccd350c')

prepare() {
  # fix build and remove unnecessary import from tests
  patch -Np1 -i fix-build.patch
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
