# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=regioneReloaded
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Multiple Association for Genomic Region Sets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-ggplot2
  r-ggrepel
  r-rcolorbrewer
  r-regioner
  r-reshape2
  r-rtsne
  r-scales
  r-umap
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-genomeinfodb
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-tests.patch")
md5sums=('1bef2814616c6b3bf4d5a4d5bc7ca8ba'
         'de0dc0c63b3a20635a3fe2e8d167d62c')
b2sums=('b209b860d50e8cc6addb91e751587625235afa1b08cc107774ba0d56197279a05e0974d0a3834a018faac0ba90491139fbb99e3fe34dce15566868eefcf87d2e'
        '66966c7cbe3b17342b4e6cf0040f9ec46ea7569a74311c1f8da2f7f0152346512bae7062b24f0b72ba7c761c1e1746795bdbcc24d2a447028c8117d9daf4f257')

prepare() {
  # fix tests
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
