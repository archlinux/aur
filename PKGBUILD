# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

pkgname=$_target-zlib
pkgver=1.2.11
pkgrel=2
pkgdesc='Compression library implementing the deflate compression method found in gzip and PKZIP (ARM64)'
arch=(x86_64)
url='https://www.zlib.net/'
license=('custom')
depends=($_target-glibc)
makedepends=($_target-environment)
options=(!buildflags)
source=(
  https://zlib.net/zlib-${pkgver}.tar.gz{,.asc}
)
sha256sums=(
  'c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1'
  'SKIP'
)
validpgpkeys=(
  '5ED46A6721D365587791E2AA783FCD8E58BCAFBA'
)

_srcdir=zlib-$pkgver

strip() {
  ${_target}-strip "$@"
}

objcopy() {
  ${_target}-objcopy "$@"
}

prepare() {
  cd $_srcdir

  grep -A 24 '^  Copyright' zlib.h >LICENSE
}

build() {
  cd $_srcdir

  source $_target-environment

  export CHOST=aarch64-linux-gnu

  mkdir -p build-$_target && pushd build-$_target
  ../configure --prefix=/usr/$_target
  make
  popd
}

package() {
  cd $_srcdir

  pushd build-$_target
  make install DESTDIR=${pkgdir}
  popd
  install -D -m644 LICENSE ${pkgdir}/usr/$_target/share/licenses/zlib/LICENSE
}
