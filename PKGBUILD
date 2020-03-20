# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

_pkgname=libffi
pkgname=$_target-$_pkgname
pkgver=3.3
pkgrel=1
pkgdesc='Portable foreign function interface library (ARM64)'
arch=(x86_64)
url='http://sourceware.org/libffi/'
license=(MIT)
depends=($_target-glibc)
makedepends=($_target-configure)
options=(!buildflags)
source=(
  https://github.com/libffi/libffi/releases/download/v$pkgver/libffi-$pkgver.tar.gz
)
sha256sums=(
  '72fba7922703ddfa7a028d513ac15a85c8d54c8d67f55fa5a4802885dc652056'
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
  $_target-configure --enable-pax_emutramp
  make
  popd
}

package() {
  cd $_srcdir

  pushd build-$_target
  make DESTDIR="$pkgdir" install
  popd
}
