# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scGPS
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A complete analysis of single cell subpopulations, from identifying subpopulations to analysing their relationship (scGPS = single cell Global Predictions of Subpopulation)"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  lapack
  onetbb
  r-caret
  r-deseq2
  r-dplyr
  r-dynamictreecut
  r-fastcluster
  r-ggplot2
  r-glmnet
  r-locfit
  r-rcpp
  r-rcpparmadillo
  r-rcppparallel
  r-singlecellexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocparallel
  r-clusterprofiler
  r-cowplot
  r-dendextend
  r-devtools
  r-dose
  r-e1071
  r-knitr
  r-networkd3
  r-org.hs.eg.db
  r-rcolorbrewer
  r-reactomepa
  r-reshape2
  r-rmarkdown
  r-rtsne
  r-testthat
  r-wgcna
  r-xlsx
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-build.patch")
md5sums=('e295d304077a4e07b2796daa1da49ab1'
         '10f827551e2b78263235e157e5b6a4b2')
b2sums=('5800aeef8d0abea93a4280aa8b8775edc0771164307b35a5eaf9f98d08dbb09800815f0fe7ec1843c3cd16dc2ab46f579c1b47e8126fc685e8bd10ccd43df724'
        'e2f840b1d0e9a8897ac8233ce695ea40e658797e01ad46f50bb5e7528efcf3797ec402b22c92d0b8a16c96bd7f4146664b81f9e7998525057426b61d05693e89')

prepare() {
  # fix linking with onetbb
  patch -Np1 -i fix-build.patch
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
