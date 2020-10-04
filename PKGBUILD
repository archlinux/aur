# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

_pkgname=expat
pkgname=$_target-expat
pkgver=2.2.10
pkgrel=1
pkgdesc='An XML parser library (ARM64)'
arch=(x86_64)
url='https://libexpat.github.io/'
license=(custom)
depends=($_target-glibc)
makedepends=($_target-cmake)
options=(!buildflags)
source=(
  https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/expat-${pkgver}.tar.bz2{,.asc}
)
sha256sums=(
  'b2c160f1b60e92da69de8e12333096aeb0c3bf692d41c60794de278af72135a5'
  'SKIP'
)
validpgpkeys=(
  3176EF7DB2367F1FCA4F306B1F9B0E909AF37285 # Sebastian Pipping
)

_srcdir=$_pkgname-$pkgver

strip() {
  ${_target}-strip "$@"
}

objcopy() {
  ${_target}-objcopy "$@"
}

build() {
  cd $_srcdir

  mkdir -p build-$_target && pushd build-$_target
  $_target-cmake -DCMAKE_BUILD_TYPE=Release ..
  make
  popd
}

package() {
  cd $_srcdir

  pushd build-$_target
  make DESTDIR="$pkgdir" install
  popd
}
