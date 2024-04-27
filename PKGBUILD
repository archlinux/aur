# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=regioneReloaded
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
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
md5sums=('38175e4bcc9ccb951f79fca8238897b2'
         'de0dc0c63b3a20635a3fe2e8d167d62c')
b2sums=('844328c56506464468dd87b03ee054e5074d6a3acdf102f56658da205ec471b74879059c9f42d6ba65961ad5ef3653e4848a587a469d40ac800eb709fe13732c'
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
