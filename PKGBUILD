# Maintainer: Josh Sixsmith <josh dot sixsmith at gmail dot com>

pkgname=tiledb
_pkgname=TileDB
pkgver=2.19.2
pkgrel=1
pkgdesc="The Universal Storage Engine"
arch=('x86_64')
url="https://tiledb.com/"
license=('MIT')
makedepends=('make')
depends=('gcc' 'cmake' 'lz4' 'bzip2' 'zstd' 'zlib' 'libwebp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TileDB-Inc/TileDB/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('741f780ca25ef3aa34e06de5ad40a9cfa7a3d71860c8c97b48788a7e5af395bb')

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
    --disable-vcpkg \
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
