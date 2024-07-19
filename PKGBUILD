# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lpSolveAPI
_pkgver=5.5.2.0-17.12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Interface to 'lp_solve' Version 5.5.2.0"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.0-only')
depends=(
  lpsolve
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "system-libs.patch")
md5sums=('10cf1c9ffb22afc9af9f98c34140f5c5'
         'b05adde5cc4292eea42da677062a3c57')
b2sums=('d5c8497b33baedac66f1ef6a8addc5797702aa42743c2e7c4b144a999417be95d620b366d11f2542c4988dbebfa8cb8d83c1d3c5734553bd459876d69493773c'
        'b50c98ff88ad664a9cad84c1ea8d8a277d193845b0677566d14d6b8b82522d15667c5b97e70ae1244d2ecd06a9691e924393c4d23da189bfb01224c81f0b7ed8')

prepare() {
  # use system lpsolve
  patch -Np1 -i system-libs.patch
  cd "$_pkgname"
  # rename type REAL to LPSREAL in lpsolve headers, since R headers have a conflicting definition
  cp -r /usr/include/lpsolve src/include
  sed -i 's/REAL/LPSREAL/g' -- src/include/*.h
  mv inst/include/RlpSolve{,Link}.h src/include/
  # remove the unnecessary header files so that they don't get installed
  rm -r inst/include
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla lpSolveAPI.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
