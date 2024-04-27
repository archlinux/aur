# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SparseArray
_pkgver=1.2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Efficient in-memory representation of multidimensional sparse arrays"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-iranges
  r-matrixgenerics
  r-matrixstats
  r-s4arrays
  r-s4vectors
  r-xvector
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-delayedarray
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-build.patch")
md5sums=('42ba66c3146b623250558daa44adf389'
         'c0da77a49b31fa4289551eb7546a3aa7')
b2sums=('a5e595e58e880d079a3ab5ec58537695cce2ae7cf8823f7ca1bb8a337be653d4d44bfaf546db1ab9185defb844abd761d003d5ce17616bcb0184d1a40b53211d'
        '33c748deb9824010dba09c84d996f149a51be6d4c1a3a6eb9fa50fe39e4f08bab250714f752d1dbf8c17bf40e444f694c6243ab06024f8cb9515d4853e8ef5e0')

prepare() {
  # fix format string errors
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
