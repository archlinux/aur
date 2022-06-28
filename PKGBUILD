# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Vincent BESANCON (bigbrozer) <besancon.vincent@gmail.com>
pkgname=azure-storage-fuse
pkgver=1.4.4
pkgrel=1
pkgdesc="A virtual file system adapter for Azure Blob storage"
arch=('x86_64')
url="https://github.com/Azure/azure-storage-fuse"
license=('MIT')
depends=(
    'boost-libs'
    'curl'
    'fuse'
    'gnutls'
    'libgcrypt'
)
makedepends=(
    'boost'
    'cmake'
    'gcc11'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Azure/azure-storage-fuse/archive/refs/tags/blobfuse-$pkgver.tar.gz")
sha256sums=('abc87a2c06fcc7fad714df4accbfc346e7759560e8b4cd64318ad499bdc7c221')

build() {
  cd "$pkgname-blobfuse-$pkgver" || return

  # Use gcc-11 here, too much deprecations in gcc-12
  export CC=gcc-11 CXX=g++-11

  # Build Azure Storage lib first
  mkdir -p cpplite/build.release
  env -C cpplite/build.release cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_ADLS=ON \
    -DUSE_OPENSSL=OFF \
    ..
  cmake --build cpplite/build.release

  # Build blobfuse
  mkdir -p build
  env -C build cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBoost_USE_STATIC_LIBS=OFF \
    ..
  cmake --build build
}

package() {
  cd "$pkgname-blobfuse-$pkgver" || return

  make -C build DESTDIR="$pkgdir/" install
  install -d "$pkgdir/usr/share/doc/$pkgname/"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install README.md "$pkgdir/usr/share/doc/$pkgname/"
  install LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
