# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Alex Branham <branham@utexas.edu>
# Contributor: Phil Schaf <flying-sheep@web.de>
# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>

_pkgname=igraph
_pkgver=2.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Network Analysis and Visualization"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  arpack
  blas
  glpk
  gmp
  lapack
  libxml2
  plfit
  r-cli
  r-lifecycle
  r-magrittr
  r-pkgconfig
  r-rlang
  r-vctrs
  util-linux-libs
)
makedepends=(
  r-cpp11
)
checkdepends=(
  r-graph
  r-testthat
  r-vdiffr
)
optdepends=(
  r-ape
  r-callr
  r-decor
  r-digest
  r-graph
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
        "igraph-system-libs.patch")
md5sums=('5ec60d660bedd8242751ed0b8720280f'
         '6c7d29860961ff06147a1ca2819dcad5')
b2sums=('5ac558f237ce339c2e27a349eae6651c0b38333e2fb902b9378bde72773989520f48fb83b5ddccbb7c9aa1f93e0b211fee6489537d45a4a1ec8ab2ad5e8c5cfe'
        'b7547dbd5d8bd30bb59fc15937fb99df18f17025d8f4fc8ba5164b5257a7dbcf46271eb7d262aa0e6d17868007e15f2fa1aebc43cb7f85c377a109b87b963f3b')

prepare() {
  # Build using system libraries
  patch -Np1 -i igraph-system-libs.patch
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
