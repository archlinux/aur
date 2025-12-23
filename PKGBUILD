# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=httpgd
_pkgver=2.0.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="A 'HTTP' Server Graphics Device"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-unigd
)
makedepends=(
  r-asioheaders
  r-cpp11
)
optdepends=(
  r-covr
  r-future
  r-httr
  r-jsonlite
  r-knitr
  r-rmarkdown
  r-testthat
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('231fa425c08428df806f225af8ea3857')
b2sums=('6ebdbdc8f17966e1ad2f5922e32ef54c6f7c2d0bebd66dd0cae5cda0b32edea347852bbcafcc553527c0ab3662d6295681c5574e215cd7445e6396f3d91f0707')

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i src/lib/crow/*.h \
    -e 's|io_service->post(handler);|asio::post(io_context->get_executor(), handler);|g' \
    -e 's|io_service->dispatch(handler);|asio::dispatch(io_context->get_executor(), handler);|g' \
    -e 's|io_service|io_context|g' \
    -e 's|is.post(|asio::post(is.get_executor(),|g' \
    -e 's|address::from_string|make_address|g'
}
build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
