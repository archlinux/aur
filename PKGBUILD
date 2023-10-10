# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=V8
_pkgver=4.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Embedded JavaScript and WebAssembly Engine for R"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  nodejs
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
md5sums=('bcc93b0681a1a23154e0e4290aa3af2c')
sha256sums=('635bc20fb90206c357b0eba53d8af0789783241d300f0190fce9d6d0614c8f46')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build \
      --configure-vars="V8_PKG_LIBS=-lnode V8_PKG_CFLAGS=-I/usr/include/node"
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
