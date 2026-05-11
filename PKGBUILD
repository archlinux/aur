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
pkgver=2.30.1
pkgrel=1
pkgdesc="The Universal Storage Engine"
arch=('x86_64')
url="https://tiledb.com/"
license=('MIT')
makedepends=('git' 'cmake')
depends=('lz4' 'bzip2' 'zstd' 'zlib' 'libwebp' 'spdlog' 'curl' 'openssl' 'aws-sdk-cpp' 'vcpkg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TileDB-Inc/TileDB/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('36381f9eaa2a6defc8990aa1a95d1f0e87971748a50bf6fb705bf032ac7384cf')

build() {
  cd "$_pkgname-${pkgver//_/-}"
  [ -e "build" ] || mkdir build && cd build
  ../bootstrap \
    --prefix=/usr \
    --enable-verbose \
    --enable-serialization \
    --enable-tools \
    --enable-s3 \
    --enable-gcs \
    --enable-azure \
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
