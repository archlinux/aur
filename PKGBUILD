# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CoGAPS
_pkgver=3.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Coordinated Gene Activity in Pattern Sets"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('BSD-3-Clause')
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
b2sums=('7836a9b7c52afb7fc009e7f49af2f4f59908c39bc20e77c3a1de72419d9f7a13c7d750f43c57429ca020d139ff0b0c96a5be61eb65c5a8f38f2546ce5c8db883'
        '1c794cab3dab46e4e50461c0d533f3a524940210dee7b27662421082a9f198e0faa7286a1d441299857cb064940a88f24767d88c1988216c22c330c97605737e')

prepare() {
  # fix OpenMP
  patch -Np1 -i fix-openmp.patch
  cd "$_pkgname"
  autoupdate
  autoconf
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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
