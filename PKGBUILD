# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=dwarfs
pkgver=0.15.3
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
sha256sums=('2a9c6b7cb2841f3c7b75839da9326724a2817e4467b20e79e3e24c3eefc13eca')
b2sums=('c5ac2570bfea0ac7c4caefd07513a514688229b17a289f8ef945379f4bd87dba3864f4eed5f2bc3b59fdafdf9f15967a20733b7060c3ff674a635de27906f1ca')

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
