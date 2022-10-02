# Maintainer: ObserverOfTime <chronobserver@disroot.org>
# Based on zstd

pkgname=zstd-static
pkgver=1.5.2
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
sha256sums=('7c42d56fac126929a6a85dbc73ff1db2411d04f104fae9bdea51305663a83fd0')

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
