# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=dwarfs
pkgver=0.6.2
pkgrel=1
pkgdesc="A fast high compression read-only file system"
url='https://github.com/mhx/dwarfs'
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=(
  'fuse3' 'openssl' 'boost-libs' 'jemalloc' 'xxhash'
  'lz4' 'xz' 'zstd' 'libarchive'
  'libunwind' 'google-glog' 'fmt' 'gflags' 'double-conversion'
  # 'python'
)
makedepends=(
  'cmake' 'ruby-ronn'
  'boost' 'libevent' 'libdwarf'
)
source=("$pkgname-$pkgver.tar.bz2::https://github.com/mhx/dwarfs/releases/download/v$pkgver/dwarfs-$pkgver.tar.bz2")
cksums=('1163381221')
sha256sums=('b411c9c26df4455762c04ecd72ae18fe5a6524572252d8d1e89a9ec9347ed149')
b2sums=('dbc6d9ff6f6bf4db337633e27d9802ce57742df2e2c3497e1d92f3d20101044741e5797f1264f5dfc5228cc3c430076f9e0e02b0632d39467f22e0a2a3a8e640')

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=None \
    -D PREFER_SYSTEM_ZSTD=ON \
    -D PREFER_SYSTEM_XXHASH=ON
  #  -D WITH_PYTHON=ON

  cmake --build build
}

package() {
  cmake --install build --prefix "$pkgdir/usr"

  mv "$pkgdir/usr/sbin"/* "$pkgdir/usr/bin"
  rm -rf "$pkgdir/usr/sbin"

  install -Dm0644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
