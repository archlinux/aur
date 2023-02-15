# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=httpuv
_cranver=1.6.9
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="HTTP and WebSocket Server Library"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
depends=(
    libuv
    r-rcpp
    r-r6
    r-promises
    r-later
    zlib
)
checkdepends=(r-curl r-testthat r-websocket)
optdepends=(
    r-testthat
    r-callr
    r-curl
    r-websocket
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('8d77f25b22fa7473b45007c2048e9a38d3792d59b2716e1fcdf9e99bd585d95d')

prepare() {
  # build against system libuv
  sed -i -e 's|PKG_LIBS = ./libuv/.libs/libuv.a|PKG_LIBS = -luv|' \
      -e 's|-Ilibuv/include ||' \
      -e 's|$(SHLIB): libuv/.libs/libuv.a|$(SHLIB):|' \
      "${_cranname}/src/Makevars"
}

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

check() {
  cd "${_cranname}/tests"
  R_LIBS="${srcdir}/build" LC_TIME=C NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"

  install -Dm644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
