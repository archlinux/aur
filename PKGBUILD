# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CoGAPS
_pkgver=3.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Coordinated Gene Activity in Pattern Sets"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(BSD)
depends=(
  r-biocparallel
  r-biomart
  r-dplyr
  r-fgsea
  r-forcats
  r-ggplot2
  r-gplots
  r-msigdbr
  r-rcolorbrewer
  r-rcpp
  r-rhdf5
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
makedepends=(
  r-bh
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-seuratobject
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-openmp.patch")
md5sums=('d4c9ec9b2be6c77fbb47c632b62c84b4'
         '7bbd2f800d95d2a4a9c81526b637e772')
sha256sums=('256548f4a70afa26e70fe1903532bd585a361fdc956da858a1f659ce15a7517f'
            '778bcf1ce83ddee6b253886debe3245a48fcb2f67d09384a2697283b7108756a')

prepare() {
  # fix OpenMP
  patch -Np1 -i fix-openmp.patch
  cd "$_pkgname"
  autoupdate
  autoconf
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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
