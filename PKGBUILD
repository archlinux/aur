# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=dwarfs
pkgver=0.9.5
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
sha256sums=('6f578af60bc5696fb51bde22de1a47513cf8befc5944cb561003beb8f4612a32'
            '76c2ee96cb4c1324a7b7bcb0eb07f4f07b016e8e66552264a2461e7d7fbce15b')
b2sums=('90c0c35f28773f3af6399ca3c3aabaf366770315197adc9c4168bf37f7c88fdbc4c3c93e647132f6a36812b1bf9d27636736682376f9b821086f8793b05feed9'
        'b9ac21fd1be6e07591c7dbd3fd1ae112fd98cb64c8b3cacc575356336c420214b58aab81ea60bddad42b28284e48904a965227cf3ad6190d96541f2d8d812ff3')

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
  cmake --build build --target test -- ARGS="-E 'dwarfs/tools_test\..*'"
}

package() {
  cmake --install build --prefix "$pkgdir/usr"

  mv "$pkgdir/usr/sbin"/* "$pkgdir/usr/bin"
  rm -rf "$pkgdir/usr/sbin"

  install -Dm0644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
