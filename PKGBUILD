# Maintainer: Josh Sixsmith <josh dot sixsmith at gmail dot com>

pkgname=tiledb
_pkgname=TileDB
pkgver=2.22.0
pkgrel=1
pkgdesc="The Universal Storage Engine"
arch=('x86_64')
url="https://tiledb.com/"
license=('MIT')
makedepends=('git' 'cmake')
depends=('lz4' 'bzip2' 'zstd' 'zlib' 'libwebp' 'spdlog' 'curl' 'openssl' 'aws-sdk-cpp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TileDB-Inc/TileDB/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('55848552a169a029d2b73e14f4efc846117f41e42f742402f774290d12f410be')

build() {
  ls
  cd "$_pkgname-${pkgver//_/-}"
  [ -e "build" ] || mkdir build && cd build
  ../bootstrap \
    --prefix=/usr \
    --enable-verbose \
    --enable-serialization \
    --enable-tools \
    --enable-s3 \
    --disable-werror \
    --disable-vcpkg \
    --disable-webp
  make
}

package() {
  cd "$_pkgname-${pkgver//_/-}"
  cd build
  make DESTDIR="${pkgdir}" install-tiledb
  cd ..
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
