# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CytoML
_pkgver=2.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A GatingML Interface for Cross Platform Cytometry Data Sharing"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(AGPL3)
depends=(
  boost-libs
  libxml2
  r-biobase
  r-cytolib
  r-data.table
  r-dplyr
  r-flowcore
  r-flowworkspace
  r-ggcyto
  r-graph
  r-jsonlite
  r-opencyto
  r-rbgl
  r-rgraphviz
  r-tibble
  r-xml
  r-yaml
)
makedepends=(
  boost
  r-bh
  r-cpp11
  r-rhdf5lib
  r-rprotobuflib
)
checkdepends=(
  r-flowworkspacedata
  r-testthat
)
optdepends=(
  r-flowworkspacedata
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "system-hdf5.patch")
md5sums=('5118f217fc4d383753ddb7c749b5c949'
         'c830342f553f0cfc7ac954ec93b429c2')
sha256sums=('6e03532826526949599a15f615472c9c7f4577c51772a2ea2e4088694b7834a7'
            'f97522aab6e311702e9606c370d4e2eed01169a83d7fc01bf6bb5ad90b115a05')

prepare() {
  # use system hdf5
  patch -Np1 -i system-hdf5.patch
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
