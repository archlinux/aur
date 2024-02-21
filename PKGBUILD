# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=dwarfs
pkgver=0.9.5
pkgrel=2
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
        0001-makepkg-Disable-faulty-test.patch
        0002-makepkg-Add-needed-glog-definition.patch)
sha256sums=('6f578af60bc5696fb51bde22de1a47513cf8befc5944cb561003beb8f4612a32'
            '0b2cbcda28a2043f20e78efd20b7ce3db14b0d2022cf72f933c2c70b5c999406'
            '9ed95cae05c0c2f901665b42db0814889690d6a4d41d55b3b47d88253e081032')
b2sums=('90c0c35f28773f3af6399ca3c3aabaf366770315197adc9c4168bf37f7c88fdbc4c3c93e647132f6a36812b1bf9d27636736682376f9b821086f8793b05feed9'
        '25b6f7c606dc404665a6f81575f699599a6f841560726e2b59b514a93b400280d9153c3128ae34bba7ebe2777952b3b2166e476bd6af2e0883f83650ce7b56c9'
        '4de66b97e5c45b9bdc497a67e02ed886180412195b2b80799e0c6925296fdbda14dc3f8dbdb63250adcaa26eedc9e27cca0f5142224c45927d76ec250b865e17')

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/0001-makepkg-Disable-faulty-test.patch"
  patch -Np1 -i "$srcdir/0002-makepkg-Add-needed-glog-definition.patch"
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
