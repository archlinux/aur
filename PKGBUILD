# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=dwarfs
pkgver=0.9.6
pkgrel=1
pkgdesc="A fast high compression read-only file system"
url='https://github.com/mhx/dwarfs'
arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')
depends=(
  'fuse3' 'openssl' 'boost-libs' 'jemalloc' 'xxhash' 'fmt'
  'lz4' 'xz' 'zstd' 'brotli' 'libarchive' 'flac'
  'libunwind' 'google-glog' 'fmt' 'gflags' 'double-conversion'
)
makedepends=(
  'cmake' 'ruby-ronn'
  'python' 'python-mistletoe'
  'boost' 'libevent' 'libdwarf' 'chrono-date'
  'utf8cpp' 'range-v3'
  'gtest'
)
source=("$pkgname-$pkgver.tar.xz::https://github.com/mhx/dwarfs/releases/download/v$pkgver/dwarfs-$pkgver.tar.xz"
0001-makepkg-Disable-faulty-test.patch)
sha256sums=('62568927b086b26abe8e812cc7484f9686b509fec83248619ec60b5e4cfa752e'
            '9b16db168518a4130f6f3e05475daee2195df40e10a0f56e8aa0b5062f0a529d')
b2sums=('305587de0e31390f4d3c2701cc1b0fe9f29d2a37a363f575ae770c0037d69b77685bd593f900c71e4e9fe8dbfdf4644f1ea3158f9fdc3596583eda89d0040e88'
        '81115c6d69d201095d5207b7d878619a6f43f9f03933824e28e7cd85a164786bef1388d6a5369052c8be25db47da588a22249152ac58c78baea2cf60fcfec4a7')

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/0001-makepkg-Disable-faulty-test.patch"
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
    -D WITH_TESTS=ON \
    -D PREFER_SYSTEM_ZSTD=ON \
    -D PREFER_SYSTEM_XXHASH=ON \
    -D PREFER_SYSTEM_LIBFMT=ON \
    -D PREFER_SYSTEM_GTEST=ON

  cmake --build build
}

check() {
  #TODO: Find a way to either load the `fuse` module for the tests or disable the tests only when `fuse` module is not
  #      loaded
  #      Also wtf with perfmon test??
  cmake --build build --target test -- ARGS="-E 'dwarfs/tools_test\..*' -E 'dwarfsextract_test\.perfmon'"
}

package() {
  cmake --install build --prefix "$pkgdir/usr"

  mv "$pkgdir/usr/sbin"/* "$pkgdir/usr/bin"
  rm -rf "$pkgdir/usr/sbin"

  install -Dm0644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
