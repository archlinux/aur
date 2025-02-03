# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=V8
_pkgver=6.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Embedded JavaScript and WebAssembly Engine for R"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  libnode
  r-curl
  r-jsonlite
  r-rcpp
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e5ff6caf53fdf88f45ccdf62680213d6')
b2sums=('8885186f99739c03ce5d5a162869f7c470a38172382cad21a64636fffffa51ddae837e9ff5bace2cacca3aa41dd387b4346ec1c2945be92ed08e6d34b5e791c8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname" \
      --configure-vars="V8_PKG_LIBS=-lnode V8_PKG_CFLAGS=-I/usr/include/libnode"
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
