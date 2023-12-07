# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=dwarfs
pkgver=0.7.3
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
source=("$pkgname-$pkgver.tar.xz::https://github.com/mhx/dwarfs/releases/download/v$pkgver/dwarfs-$pkgver.tar.xz"
        0001-fix-Detect-correct-utf8cpp-header-location.patch)
sha256sums=('5c0a7cfcf637edb03541c8b0fb97d2f6e8a4bec15806d859aee6cfa05f616737'
            '613c6270a61c26e6621e52a57cef97211b59596c3086d358c9b10c298186835b')
b2sums=('63aff67cfe16c46d4dcdda641692dec2e421b695c64105c0ea8b92a38eb7abb0bf928482c17cf458e1a17c2d60943e5ae479aa561926592ca039f0f7ea71ddd7'
        'd00fbf792f546ea082f174dc2a9b08e47207a46d96c599fef99f90311d2bd97957ddad8d85eefe183b658de4da6cc367ada7807086298aa0c75d0adb4ea68083')

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/0001-fix-Detect-correct-utf8cpp-header-location.patch"
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
