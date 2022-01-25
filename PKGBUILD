# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=dwarfs
pkgver=0.5.6
pkgrel=3
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
source=("$pkgname-$pkgver.tar.bz2::https://github.com/mhx/dwarfs/releases/download/v$pkgver/dwarfs-$pkgver.tar.bz2"
        0001-Attempting-to-fix-57-1.patch)
cksums=('3786409486'
        '975092744')
sha256sums=('11e057e15dadaffacfef8f385abd54181a4babe2098446120fa4f7ba2200fc8f'
            '81f605921d7d671907c9576a857963379a09120aecb5916d37ad855760d9c1c7')
b2sums=('6d570de65358238eb8207297529f7cb632533eb6e63b5c27349add978d765e462fbeeb123962695b8092c919425454e7ef7cce6b2247ca46586b9732297ee1d1'
        '8c173de25161b744f57181f702239f89c5cee5ffaadcfe6b71e591f283fbefc9ee83fdf541f80eca7fef1a2045fe34dab29fab34e97f50df52f7752949a813d4')

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/0001-Attempting-to-fix-57-1.patch"
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
