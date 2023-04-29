# system requirements: V8 engine version 6+ is needed for ES6 and WASMsupport. On Linux you can also build against libv8-dev (Debian)or v8-devel (Fedora). We also provide static libv8 binaries formost platforms, see the README for details.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=V8
_pkgver=4.3.0
pkgname=r-${_pkgname,,}
pkgver=4.3.0
pkgrel=3
pkgdesc='Embedded JavaScript and WebAssembly Engine for R'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-curl
  r-jsonlite
  r-rcpp
  nodejs
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7e395c4faed0d2a9d647820269d2d374953fc67c6108d57d63e93ec570dbe0d0')

prepare() {
  # build with system nodejs
  sed -i '11,12d' ${_pkgname}/configure
  sed -i '11i PKG_LIBS="-lnode"\nPKG_CFLAGS="-I/usr/include/node"' ${_pkgname}/configure
}

build() {
  mkdir -p build
  R CMD INSTALL ${_pkgname} -l build
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
