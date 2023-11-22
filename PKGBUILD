# Maintainer: Josh Sixsmith <josh dot sixsmith at gmail dot com>

pkgname=tiledb
_pkgname=TileDB
pkgver=2.18.0
pkgrel=1
pkgdesc="The Universal Storage Engine"
arch=('x86_64')
url="https://tiledb.com/"
license=('MIT')
makedepends=('make')
depends=('gcc' 'cmake' 'lz4' 'bzip2' 'zstd' 'zlib' 'libwebp')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/TileDB-Inc/TileDB/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c5cc459f18bae030631830a260d8fc54690ed2887e6b64dac70e3dfc29f55691')

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
