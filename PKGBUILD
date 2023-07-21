# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=dwarfs
pkgver=0.7.1
pkgrel=1
pkgdesc="A fast high compression read-only file system"
url='https://github.com/mhx/dwarfs'
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=(
  'fuse3' 'openssl' 'boost-libs' 'jemalloc' 'xxhash' 'fmt'
  'lz4' 'xz' 'zstd' 'brotli' 'libarchive'
  'libunwind' 'google-glog' 'fmt' 'gflags' 'double-conversion'
)
makedepends=(
  'cmake' 'ruby-ronn'
  'boost' 'libevent' 'libdwarf'
  'utf8cpp'
)
source=("$pkgname-$pkgver.tar.xz::https://github.com/mhx/dwarfs/releases/download/v$pkgver/dwarfs-$pkgver.tar.xz")
sha256sums=('012352e6ce9194a2df95889d4f87b5767d372e10edbfbe9141b3ee3e447d7676')
b2sums=('d3612b751350f527be4e0bd547099d64e2fe18f812a916bd87574829034d35dfb0947d27b4cc9bc5c8219a5bbdaf9c1f81a569fdb1024f0a13dccd657e779dba')

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -W no-dev \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=None \
    -D PREFER_SYSTEM_ZSTD=ON \
    -D PREFER_SYSTEM_XXHASH=ON \
    -D PREFER_SYSTEM_LIBFMT=ON

  cmake --build build
}

package() {
  cmake --install build --prefix "$pkgdir/usr"

  mv "$pkgdir/usr/sbin"/* "$pkgdir/usr/bin"
  rm -rf "$pkgdir/usr/sbin"

  install -Dm0644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
