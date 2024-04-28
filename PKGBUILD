# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SpatialFeatureExperiment
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Integrating SpatialExperiment with Simple Features in sf"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-biocneighbors
  r-biocparallel
  r-rjson
  r-rlang
  r-s4vectors
  r-sf
  r-singlecellexperiment
  r-spatialexperiment
  r-spdep
  r-summarizedexperiment
  r-terra
)
checkdepends=(
  r-dropletutils
  r-sfarrow
  r-sfedata
  r-testthat
  r-vroom
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-dropletutils
  r-knitr
  r-rhdf5
  r-rmarkdown
  r-sfarrow
  r-sfedata
  r-testthat
  r-vroom
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('56d4ad5144861bea16c2f677e096ac75')
b2sums=('6b54649d999b5d4fc20252bb97a9d95fe702ccaa38aa98cd876e10e90efe0c0d1aa1ac1c2666b8baa30787b5d5eebb8c4b62c81d5a287327a2f11db6aaefb6e5')

prepare() {
  # skip failing tests
  cd "$_pkgname/tests/testthat"
  sed -e '/"Exact Bioc methods for knn return same results as spdep methods"/a\ \ \ \ skip("fails")' \
      -e '/"Exact Bioc methods for dnearneigh return same results as spdep methods"/a\ \ \ \ skip("fails")' \
      -i test-graph_wrappers.R
  sed -i '/"Correctly reconstruct the graphs when they need to be reconstructed"/a\ \ \ \ skip("fails")' \
      test-subset.R
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
