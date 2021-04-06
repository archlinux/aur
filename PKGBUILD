# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=dwarfs
pkgver=0.5.1
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
sha256sums=('38fd67d998e4bca9ff199c9056a57c9b67c405ec95d9f04175a26efe56fb4c72')
b2sums=('f2d969ff814fed4d075a0debafb2300ad95b3fb781f057fe2fab73323e89827c9673103f1c5cf1e4fc43d91884114b24acaaf959f712d11061d62566b425c218')

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
