# Maintainer: ObserverOfTime <chronobserver@disroot.org>
# Based on zstd

pkgname=zstd-cmake
pkgver=1.4.5
pkgrel=1
pkgdesc='Zstandard - Fast real-time compression algorithm (with cmake files)'
arch=(x86_64)
url='https://www.zstd.net/'
license=('BSD' 'GPL2')
options=('staticlibs')
depends=('zlib' 'xz' 'lz4')
makedepends=('cmake')
checkdepends=('gtest')
provides=("zstd=${pkgver}" "zstd-static=${pkgver}")
conflicts=('zstd' 'zstd-static' 'zstd-git')
source=("https://github.com/facebook/zstd/releases/download/v${pkgver}/zstd-${pkgver}.tar.gz")
sha256sums=('98e91c7c6bf162bf90e4e70fdbc41a8188b9fa8de5ad840c401198014406ce9e')

prepare() {
    cd zstd-${pkgver}
    patch -d build/cmake CMakeLists.txt -p1 <<'EOF'
10c10
< cmake_minimum_required(VERSION 2.8.9 FATAL_ERROR)
---
> cmake_minimum_required(VERSION 2.8.12 FATAL_ERROR)
EOF
}

build() {
  cd zstd-${pkgver}
  cmake -B ../builddir \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib build/cmake
  cmake --build ../builddir
  make -C contrib/pzstd
}

check() {
  cd zstd-${pkgver}
  make check
  make -C contrib/pzstd test
}

package() {
  cd zstd-${pkgver}
  install -Dm755 contrib/pzstd/pzstd "${pkgdir}/usr/bin/pzstd"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  DESTDIR="${pkgdir}" cmake --install ../builddir
}
