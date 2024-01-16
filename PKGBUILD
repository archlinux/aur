# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=dwarfs
pkgver=0.7.5
pkgrel=1
pkgdesc="A fast high compression read-only file system"
url='https://github.com/mhx/dwarfs'
arch=('x86_64' 'aarch64')
license=('GPL-3.0')
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
sha256sums=('31fabc3a3a8233e247f77149a7c702b79c4105dc814459fef85d4c4747a2b4f0')
b2sums=('c40d3fd74d750a3da2073ac75a9ddc6c0bf11e9aeb1c7718f0181b33820e6d5ca09ba25be7d6b7224036e02665115f4d43378b5dfe0975a4eea83eb866cfab01')

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  # Setting up release flags manually here so we get to use `CMAKE_BUILD_TYPE=None`
  # and keep makepkg-defined flags for build
  # cf. https://wiki.archlinux.org/title/CMake_package_guidelines#Fixing_the_automatic_optimization_flag_override
  export CFLAGS="$CFLAGS -DNDEBUG"
  export CXXFLAGS="$CXXFLAGS -DNDEBUG"

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
