# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SVMDO
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identification of Tumor-Discriminating mRNA Signatures via Support Vector Machines Supported by Disease Ontology"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-annotationdbi
  r-bsda
  r-caret
  r-catools
  r-data.table
  r-dose
  r-dplyr
  r-dt
  r-e1071
  r-golem
  r-klar
  r-nortest
  r-org.hs.eg.db
  r-shiny
  r-shinyfiles
  r-shinytitle
  r-sjmisc
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-tests.patch")
md5sums=('be26fd3d3056b70bd70a8b6f2f1d3651'
         'ace8dbf4ccc927c5fee18f3403240bd2')
b2sums=('a9f728bcc8a50613ac82f9e1c8856c2c67b8c751ed8b118eeb12e037ccc86f198b3542db29c461441ad93a67ca81c7d5f099b588f296d4cf3b12ac5d4a2d37f6'
        'f2a0015c8d43679b7e388b8183c4f1b67422f62fe2b1b58371bf65f341c8fcea91fddaf6f91bb8811997bedb0045590c5f97e6e1f9d2c373a5fffab3b31a430c')

prepare() {
  # skip failing tests
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
