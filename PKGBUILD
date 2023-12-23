# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SnowballC
_pkgver=0.7.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Snowball Stemmers Based on the C 'libstemmer' UTF-8 Library"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(BSD)
depends=(
  libstemmer
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c95c904382d30d7256d1fa710f9327f0')
b2sums=('da8d73888edc5a8b16af561b47ca88703a6619b0f00be235bbb610adfb43ab7e006cb7aa59e7a59ad6e6fe70135a5a12f1f8235145a09f8c99a0641bc74d7b87')

prepare() {
  # use system libstemmer
  cd "$_pkgname/src"
  rm *.h api.c libstemmer_utf8.c stem_*.c utilities.c
  echo "PKG_LIBS := -lstemmer" >> Makevars
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
