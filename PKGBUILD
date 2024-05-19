# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SpatialFeatureExperiment
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integrating SpatialExperiment with Simple Features in sf"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
  r-biocgenerics
  r-biocneighbors
  r-biocparallel
  r-data.table
  r-dropletutils
  r-ebimage
  r-lifecycle
  r-rjson
  r-rlang
  r-s4vectors
  r-sf
  r-sfheaders
  r-singlecellexperiment
  r-spatialexperiment
  r-spdep
  r-summarizedexperiment
  r-terra
  r-zeallot
)
checkdepends=(
  r-rbioformats
  r-sfarrow
  r-sfedata
  r-testthat
  r-xml2
)
optdepends=(
  r-arrow
  r-biocstyle
  r-dplyr
  r-knitr
  r-rbioformats
  r-rhdf5
  r-rmarkdown
  r-scater
  r-seurat
  r-seuratobject
  r-sfarrow
  r-sfedata
  r-testthat
  r-tidyr
  r-voyager
  r-xml2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-tests.patch")
md5sums=('ffdd8b3f445b1a9d5f5a8fe154f07c55'
         'f291ecaed60ed25084e6b663457c1268')
b2sums=('db8b0d4007e1fad69c9bc66e57c127216f0662238d4f0a5bb7e72bb216d215ffd7abeb0ef7c5b39dd7eead16b2fddcdda04a44e9e39ca2ec4ac8d4780f978c5b'
        '99ad8de9094bc321b6bfc2597ff1f9e06627a5cdb277fd0d1a5de5ecf76885b7163d00ea2f1fa9a6701cea0b4a5cea458f8a727c4f0dcadb5a493afd22940cc1')

prepare() {
  # skip tests that require r-voyager
  patch -Np1 -i fix-tests.patch
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
