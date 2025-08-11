# Maintainer: Josh Sixsmith <josh dot sixsmith at gmail dot com>
# notes from vcpkg package:
# The repository containing vcpkg recipes cannot legally be included, so you
# will have to manually clone it to the $HOME/.local/share/vcpkg directory.
# 
#   git clone https://github.com/microsoft/vcpkg $VCPKG_ROOT
# 
# You are also responsible for manually updating this repository.
# 
#   git -C $VCPKG_ROOT pull

pkgname=tiledb
_pkgname=TileDB
pkgver=2.28.0
pkgrel=1
pkgdesc="The Universal Storage Engine"
arch=('x86_64')
url="https://tiledb.com/"
license=('MIT')
makedepends=('git' 'cmake')
depends=('lz4' 'bzip2' 'zstd' 'zlib' 'libwebp' 'spdlog' 'curl' 'openssl' 'aws-sdk-cpp' 'vcpkg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TileDB-Inc/TileDB/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('de731cd0c8e82fe8cfca084b937dc0df41e451c8eb93071e4cc5aba7bbef854e')

build() {
  cd "$_pkgname-${pkgver//_/-}"
  patch --strip=1 --input=../../blosc.patch
  [ -e "build" ] || mkdir build && cd build
  ../bootstrap \
    --prefix=/usr \
    --enable-verbose \
    --enable-serialization \
    --enable-tools \
    --enable-s3 \
    --disable-werror
  make -j $(nproc --all)
}

package() {
  cd "$_pkgname-${pkgver//_/-}"
  cd build
  make DESTDIR="${pkgdir}" install-tiledb
  cd ..
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
