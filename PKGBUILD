# Maintainer: Josh Sixsmith <josh dot sixsmith at gmail dot com>

pkgname=tiledb
_pkgname=TileDB
pkgver=2.27.0
pkgrel=1
pkgdesc="The Universal Storage Engine"
arch=('x86_64')
url="https://tiledb.com/"
license=('MIT')
makedepends=('git' 'cmake')
depends=('lz4' 'bzip2' 'zstd' 'zlib' 'libwebp' 'spdlog' 'curl' 'openssl' 'aws-sdk-cpp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TileDB-Inc/TileDB/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a1d42e675a983291c1a0edd1a13f70e26649700160bb2bee5d6011a2af55837a')

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
