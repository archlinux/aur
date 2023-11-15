# Maintainer: Josh Sixsmith <josh dot sixsmith at gmail dot com>

pkgname=tiledb
_pkgname=TileDB
pkgver=2.18.0_rc4
pkgrel=2
pkgdesc="The Universal Storage Engine"
arch=('x86_64')
url="https://tiledb.com/"
license=('MIT')
makedepends=('make')
depends=('gcc' 'cmake' 'lz4' 'bzip2' 'zstd' 'zlib' 'libwebp')
source=("$pkgname-${pkgver//_/-}.tar.gz::https://github.com/TileDB-Inc/TileDB/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('4426fd901b102b85d0cef234dd9778ca736f8b589c6a2936aab2321c7931911a')

build() {
  ls
  cd "$_pkgname-${pkgver//_/-}"
  [ -e "build" ] || mkdir build && cd build
  ../bootstrap \
    --prefix=$pkgdir/usr/local \
    --enable-verbose \
    --enable-serialization \
    --enable-tools \
    --disable-werror \
    --disable-webp
  make -j "$(nproc)"
}

package() {
  cd "$_pkgname-${pkgver//_/-}"
  cd build
  make install-tiledb
  cd ..
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
