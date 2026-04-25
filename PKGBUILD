# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Alex Branham <branham@utexas.edu>
# Contributor: Phil Schaf <flying-sheep@web.de>
# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>

_pkgname=igraph
_pkgver=2.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
#        "igraph-system-libs20251202.patch")
md5sums=('6e4cb01dbe35497d3e3c54b07c3d1777')
b2sums=('fa2c60e816d09d00df32710b490ea4f27311fa1b4fa3ed66e54f03b98a0252290e924a75511b2725bae2e7293326402385977fa8eb0d8755a4653898d0ed8830')
#         '4f7de12ace8af846bafcfe0358f00dd3')
#        '1570ec5fd587860871962d5bf7a2c718b52e6b904a41d084f0df911f289d743bca51d6acc3d7e75f4faebeeb812cf869b2fb2eec20651f6b4ebb854e0935cb36')

#prepare() {
  # Build using system libraries
#  patch -Np1 -i igraph-system-libs20251202.patch
#}

prepare() {
  # Instead of patching, modify files directly with sed

  # 1. In igraph/configure: Remove ${MINI_GMP_SOURCES}
  sed -i "s/OBJECTS='\${IGRAPH_SOURCES} \${GLUE_C_SOURCES} \${GLUE_CPP_SOURCES} \${MINI_GMP_SOURCES}'/OBJECTS='\${IGRAPH_SOURCES} \${GLUE_C_SOURCES} \${GLUE_CPP_SOURCES}'/" igraph/configure

  # 2. In igraph/src/Makevars.in: Add -I/usr/include/uuid to PKG_CPPFLAGS
  sed -i 's|PKG_CPPFLAGS=-DUSING_R -I\. -Ivendor|PKG_CPPFLAGS=-DUSING_R -I/usr/include/uuid -I. -Ivendor|' igraph/src/Makevars.in

  # 3. In igraph/src/Makevars.in: Add -lgmp -luuid to PKG_LIBS
  sed -i 's|PKG_LIBS = @libs@ $(LAPACK_LIBS) $(BLAS_LIBS) $(FLIBS)|PKG_LIBS = @libs@ $(LAPACK_LIBS) $(BLAS_LIBS) $(FLIBS) -lgmp -luuid|' igraph/src/Makevars.in

  # 4. In igraph/src/vendor/config.h: Remove INTERNAL_GMP definition
  sed -i '/^#define INTERNAL_GMP 1$/d' igraph/src/vendor/config.h

  # 5. In igraph/src/vendor/config.h: Fix indentation for HAVE___UINT128_T
  sed -i 's/^#  define HAVE___UINT128_T 1/#define HAVE___UINT128_T 1/' igraph/src/vendor/config.h
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
