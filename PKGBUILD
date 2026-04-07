# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Alex Branham <branham@utexas.edu>
# Contributor: Phil Schaf <flying-sheep@web.de>
# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>

_pkgname=igraph
_pkgver=2.2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Network Analysis and Visualization"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  glpk
  gmp
  lapack
  libxml2
  r-cli
  r-lifecycle
  r-magrittr
  r-pkgconfig
  r-rlang
  r-vctrs
  util-linux-libs
)
makedepends=(
  gcc-fortran
  r-cpp11
)
checkdepends=(
  r-graph
  r-rgl
  r-testthat
  r-vdiffr
)
optdepends=(
  r-ape
  r-callr
  r-decor
  r-digest
  r-igraphdata
  r-knitr
  r-rgl
  r-rmarkdown
  r-scales
  r-testthat
  r-vdiffr
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "igraph-system-libs20251202.patch")
md5sums=('7638004db83f08d6e80284d1401d1359'
         '4f7de12ace8af846bafcfe0358f00dd3')
b2sums=('5ac019bd751f9276404a5a2d3330271e3613e1de8d82d289321f2f5afb69cfb2feb0a4e30986f8d36d27a70bf3cae1171e7e97058be6f6f99128f65a6abf6ba2'
        '1570ec5fd587860871962d5bf7a2c718b52e6b904a41d084f0df911f289d743bca51d6acc3d7e75f4faebeeb812cf869b2fb2eec20651f6b4ebb854e0935cb36')

prepare() {
  # Build using system libraries
  patch -Np1 -i igraph-system-libs20251202.patch
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
