# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

_pkgname=lz4
pkgname=$_target-$_pkgname
pkgver=1.9.2
pkgrel=1
pkgdesc='Very fast lossless compression algorithm (ARM64)'
arch=(x86_64)
url='http://lz4.github.io/lz4/'
license=(GPL2)
depends=($_target-glibc)
makedepends=($_target-environment)
options=(!buildflags)
source=(
  https://github.com/$_pkgname/$_pkgname/archive/v$pkgver.tar.gz
)
sha256sums=(
  '658ba6191fa44c92280d4aa2c271b0f4fbc0e34d249578dd05e50e76d0e5efcc'
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

  source $_target-environment

  mkdir -p build-$_target && pushd build-$_target
  make \
    CC=$_target-gcc \
    CXX=$_target-g++ \
    AR=$_target-ar \
    STRIP=$_target-strip \
    -C ..
  popd
}

package() {
  cd $_srcdir

  pushd build-$_target
  make -C .. PREFIX=/usr/$_target DESTDIR="$pkgdir/" install
  popd
}
