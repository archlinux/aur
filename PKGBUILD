# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=unigd
_pkgver=0.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Universal Graphics Device"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  cairo
  libpng
  libtiff
  r-systemfonts
  zlib
)
makedepends=(
  r-cpp11
)
checkdepends=(
  r-fontquiver
  r-testthat
  r-xml2
)
optdepends=(
  r-covr
  r-fontquiver
  r-knitr
  r-rmarkdown
  r-testthat
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$_pkgname-tiff.patch::https://github.com/nx10/unigd/pull/17.patch")
md5sums=('1674fafbd0e2d6fec077499a6859b1a1'
         '6edc5c3253cb665014e2087f4e0f17b1')
b2sums=('28e3760d4740fbd14221dd8cceaec2943a3673db3eac8720bc08f5d7f223f6bbf733c34a0ab7cf3664dc12e069376a9e2177465643928f6578cf1c8f34374d90'
        '7dc5125999ece6a23c8567006d873d2c4b705b97cae324bc6508cf4700b9378ae0642d1b94670b3ca46074be35192ae2991c05acd6ed97658626dbfdde3d0736')

prepare() {
  # fix libtiff configuration
  patch -Np1 -d "$_pkgname" < "$_pkgname-tiff.patch"
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
