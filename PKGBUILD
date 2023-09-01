# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Kiri <kiri@vern.cc>

_pkgname=RProtoBuf
_pkgver=0.4.20
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="R Interface to the 'Protocol Buffers' 'API' (Version 2 or 3)"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  abseil-cpp
  protobuf
  r-rcpp
)
checkdepends=(
  r-tinytest
)
optdepends=(
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$pkgname-protobuf-22-1.patch::https://github.com/eddelbuettel/rprotobuf/pull/93/commits/4a05d09388c6bda856d0ed65f031a11d0c50410d.patch"
        "$pkgname-protobuf-22-2.patch::https://github.com/eddelbuettel/rprotobuf/pull/93/commits/b5dae880dce23e55892b69311835ea744cc914e5.patch")
md5sums=('ce9406994b331ee607b772a6c4e0bae7'
         'df86b1f2b017246f4c2f5c0a48f73869'
         'b03fd3cb989c7b3026799c65baecb83f')
sha256sums=('e6608210d8077253cd0b09d16499f79ef8ce2de42365828a38848c615069bce0'
            '305dc29965524481dea3825ca36527cef54cf5ccec81b9b102d66d90942d4e07'
            'e98fb24933c86ab7afd648b2ca292034408f3990d0d05e269c3ecc64960b8b01')

prepare() {
  cd "$_pkgname"
  # fix compatibility with protobuf>=22
  patch -Np1 -i "../$pkgname-protobuf-22-1.patch"
  patch -Np1 -i "../$pkgname-protobuf-22-2.patch"
}

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla tinytest.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
