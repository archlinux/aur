# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lpSolveAPI
_pkgver=5.5.2.0-17.11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('e43f4e573f77004f50566c06d1e0be62'
         'b05adde5cc4292eea42da677062a3c57')
b2sums=('9293dda4044b2657ac4f70b532e7d59d7a0b02d1ff747e3939f23f0ba339ce339813a49fecd5dda623b46fb1fe248ec01c66c6611a80f51629039c72a756b17d'
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
