# Maintainer: Josh Sixsmith <josh dot sixsmith at gmail dot com>

pkgname=tiledb
_pkgname=TileDB
pkgver=2.24.1
pkgrel=3
pkgdesc="The Universal Storage Engine"
arch=('x86_64')
url="https://tiledb.com/"
license=('MIT')
makedepends=('git' 'cmake')
depends=('lz4' 'bzip2' 'zstd' 'zlib' 'libwebp' 'spdlog' 'curl' 'openssl' 'aws-sdk-cpp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TileDB-Inc/TileDB/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c04d1a75b1241388de1da7e6d4022d997acf061f4042ea5ecf9cecb7abe14dda')

build() {
  ls
  cd "$_pkgname-${pkgver//_/-}"
  patch --strip=1 --input=../../'0001-Include-algorithm-header-for-gcc-14.-5139.patch'
  [ -e "build" ] || mkdir build && cd build
  ../bootstrap \
    --prefix=/usr \
    --enable-verbose \
    --enable-serialization \
    --enable-tools \
    --enable-s3 \
    --disable-werror \
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
