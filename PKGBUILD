# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=dwarfs
pkgver=0.5.5
pkgrel=1
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
source=("${pkgname}-${pkgver}.tar.bz2::https://github.com/mhx/dwarfs/releases/download/v${pkgver}/dwarfs-${pkgver}.tar.bz2")
sha256sums=('3bc73b4c3031bda3be873422baadcc704506211f9aee65dc7470a6a064d690ac')
b2sums=('01a599452834abac9930324dd4d41b768f8182b14efb34fecabf33915859864e00d48c8fb11aff4864e067bc8daf9b0d833eec01e662e5b56943b0ef7c45bcb2')

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
