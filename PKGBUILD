# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=dwarfs
pkgver=0.4.1
pkgrel=1
pkgdesc="A fast high compression read-only file system"
url='https://github.com/mhx/dwarfs'
arch=('x86_64')
license=('GPL3')
depends=(
  'fuse3' 'openssl' 'boost-libs' 'jemalloc' 'xxhash'
  'lz4' 'xz' 'zstd' 'libarchive'
  'libunwind' 'google-glog' 'fmt' 'gflags' 'double-conversion'
  # 'python'
)
makedepends=(
  'cmake' 'sparsehash' 'ruby-ronn'
  'boost' 'libevent' 'snappy' 'libdwarf' 'libaio'
  # 'liburing' 'libsodium'
)
source=("${pkgname}-${pkgver}.tar.bz2::https://github.com/mhx/dwarfs/releases/download/v${pkgver}/dwarfs-${pkgver}.tar.bz2")
sha256sums=('f9c3b5eecea153644e3ccee84b928bac9cbe06daa260feeee8bbb794f7d3142f')
b2sums=('3490d625fd718be4451d5a551b6931b0c9316d88cdda91b90a724f3ab732a3916431a13e343bcb79a2e0415ffc0a990d2546eeb1738c55282e9fb9c85d3ba1ae')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=None \
    -D PREFER_SYSTEM_ZSTD=ON \
    -D PREFER_SYSTEM_XXHASH=ON

  cmake --build build
}

package() {
  cmake --install build --prefix "${pkgdir}/usr"

  mv "${pkgdir}/usr/sbin"/* "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/sbin"

  install -Dm0644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
