# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=dwarfs
pkgver=0.15.2
pkgrel=1
pkgdesc="A fast high compression read-only file system"
url='https://github.com/mhx/dwarfs'
arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')
depends=(
  'fuse3' 'openssl' 'boost-libs' 'jemalloc' 'xxhash' 'fmt'
  'lz4' 'xz' 'zstd' 'brotli' 'libarchive' 'flac'
)
makedepends=(
  'cmake'
  'boost' 'libdwarf' 'chrono-date'
  'utf8cpp' 'range-v3' 'nlohmann-json'
  'gtest' 'parallel-hashmap'
)
source=("$pkgname-$pkgver.tar.xz::https://github.com/mhx/dwarfs/releases/download/v$pkgver/dwarfs-$pkgver.tar.xz")
sha256sums=('6b7edcb2121347e273753d949f72913f006ec12477248384b24c48989ec34995')
b2sums=('d5ba725889b98516976a663850c9cc04ee58ac4047d16b5aec771870a93d70c84583f3488b61f31368dd6b989b0c157d6471317d55f715c3dec88e2a12623c0b')

build() {
  # Setting up release flags manually here so we get to use `CMAKE_BUILD_TYPE=None`
  # and keep makepkg-defined flags for build
  # cf. https://wiki.archlinux.org/title/CMake_package_guidelines#Fixing_the_automatic_optimization_flag_override
  export CFLAGS="$CFLAGS -DNDEBUG"
  export CXXFLAGS="$CXXFLAGS -DNDEBUG"

  # Disable ccache here since makepkg already handly this
  cmake -B build -S "$pkgname-$pkgver" \
    -W no-dev \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_INSTALL_SBINDIR=bin \
    -D CMAKE_BUILD_TYPE=None \
    -D WITH_TESTS=ON \
    -D PREFER_SYSTEM_GTEST=ON \
    -D DISABLE_CCACHE=ON \
    -D DISABLE_MOLD=ON

  cmake --build build
}

check() {
  # Sparse file tests fail in build environments where the filesystem does not
  # support holes (e.g. tmpfs), so exclude them.
  ctest --test-dir build --exclude-regex 'sparse|os_access_generic\.symlink_info'
}

package() {
  cmake --install build --prefix "$pkgdir/usr"
  rm "$pkgdir/usr/bin/mount.dwarfs"
  ln -s dwarfs "$pkgdir/usr/bin/mount.dwarfs"

  install -Dm0644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
