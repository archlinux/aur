# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=dwarfs
pkgver=0.5.2
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
sha256sums=('14fbb0fe3f8133e0e919098405d5d0a316fd6494a7f9804cec674f719919d67c')
b2sums=('b83b7df085afb39df3aa9b139ce7cfeee71287ad8ce83433a2c3cf17a096e479da95e76057379be81ec79a819dfe9754a8df44492044fc49fbd1e2d4371af878')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=None \
    -D PREFER_SYSTEM_ZSTD=ON \
    -D PREFER_SYSTEM_XXHASH=ON
  #  -D WITH_PYTHON=ON

  cmake --build build
}

package() {
  cmake --install build --prefix "${pkgdir}/usr"

  mv "${pkgdir}/usr/sbin"/* "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/sbin"

  install -Dm0644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
