# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

_pkgname=zstd
pkgname=$_target-$_pkgname
pkgver=1.4.4
pkgrel=1
pkgdesc='Zstandard - Fast real-time compression algorithm (ARM64)'
arch=(x86_64)
url='https://www.zstd.net/'
license=(BSD GPL2)
depends=($_target-zlib $_target-xz $_target-lz4)
makedepends=($_target-environment)
options=(!buildflags)
source=(
  https://github.com/facebook/$_pkgname/archive/v$pkgver.tar.gz
  'Fix-wrong-printf-escaping.patch'
)
sha256sums=(
  'a364f5162c7d1a455cc915e8e3cf5f4bd8b75d09bc0f53965b0c9ca1383c52c8'
  'bd778b14ecb8b30406ebab04f165d274a147d58b9d1e36f207906690fd072285'
)

_srcdir=$_pkgname-$pkgver

strip() {
  ${_target}-strip "$@"
}

objcopy() {
  ${_target}-objcopy "$@"
}

prepare() {
  cd $_srcdir

  for patch in "$srcdir/"*.patch; do
    msg2 "Applying patch $patch"
    patch -p1 -i "$patch"
  done
}

build() {
  cd $_srcdir

  source $_target-environment

  make CC=$_target-gcc PREFIX=/usr/$_target
}

package() {
  cd $_srcdir

  make PREFIX=/usr/$_target DESTDIR="$pkgdir/" install
}
