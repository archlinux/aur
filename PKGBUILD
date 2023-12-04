# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=regioneReloaded
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RegioneReloaded: Multiple Association for Genomic Region Sets"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
sha256sums=('5403ee99be6a27a97e3def6161f92fda138f14bf30662b56581ad07fd4024c15'
            'fa83b4487225fc5d5d38e67e9bb6306e988e1c48ef31ba42036fc260c6aee1f9')

prepare() {
  # fix tests
  patch -Np1 -i fix-tests.patch
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
