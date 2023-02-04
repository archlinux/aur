# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=dwarfs
pkgname=${_pkgname}-git
pkgver=0.7.0.RC4.r0.g3dfad5a
pkgrel=1
pkgdesc="A fast high compression read-only file system"
url='https://github.com/mhx/dwarfs'
arch=('x86_64')
license=('GPL3')
depends=(
  'fuse3' 'openssl' 'boost-libs' 'jemalloc' 'xxhash'
  'lz4' 'xz' 'zstd' 'libarchive' 'brotli'
  'libunwind' 'google-glog' 'fmt' 'gflags' 'double-conversion'
  # 'python'
)
makedepends=(
  'git' 'cmake' 'ruby-ronn'
  'boost' 'libevent' 'libdwarf'
)
source=("$pkgname::git+https://github.com/mhx/dwarfs.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"

  git submodule update --init --depth=1
}

build() {
  cmake -B build -S "$pkgname" \
    -W no-dev \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_LIBRARY_ARCHITECTURE="$CARCH" \
    -D PREFER_SYSTEM_ZSTD=ON \
    -D PREFER_SYSTEM_XXHASH=ON \
    -D PREFER_SYSTEM_LIBFMT=ON

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build \

  mv "$pkgdir/usr/sbin"/* "$pkgdir/usr/bin"
  rm -rf "$pkgdir/usr/sbin"

  cd "$pkgname"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
