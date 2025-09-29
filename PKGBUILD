# Maintainer: Andrea Oggioni <AOggioni530@gmail.com>
# Contributor: ObserverOfTime <chronobserver@disroot.org>
# Based on zstd

pkgname=zstd-static
pkgver=1.5.7
pkgrel=1
pkgdesc='Zstandard - Fast real-time compression algorithm (with static lib)'
arch=(x86_64)
url='https://www.zstd.net/'
license=('BSD' 'GPL2')
options=('staticlibs')
depends=('zlib' 'xz' 'lz4')
makedepends=('cmake')
checkdepends=('gtest')
conflicts=('zstd')
provides=("zstd=${pkgver}" "libzstd.so=1-64")
source=("https://github.com/facebook/zstd/releases/download/v${pkgver}/zstd-${pkgver}.tar.gz")
sha256sums=('eb33e51f49a15e023950cd7825ca74a4a2b43db8354825ac24fc1b7ee09e6fa3')

build() {
  export CFLAGS+=' -ffat-lto-objects'
  export CXXFLAGS+=' -ffat-lto-objects'

  cmake -B builddir \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DZSTD_BUILD_CONTRIB=ON \
        -DZSTD_BUILD_TESTS=ON \
        zstd-${pkgver}/build/cmake
  cmake --build builddir
}

check() {
  ctest -VV --test-dir builddir
}

package() {
  DESTDIR="${pkgdir}" cmake --install builddir
  install -Dm644 zstd-${pkgver}/LICENSE \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
