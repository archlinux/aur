# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Peter Lamby <peterlamby [at] web [dot] de>
# Contributor: Stéphane Gaudreault <stephane [at] archlinux [dot] org>
# Contributor: Thomas Dziedzic <gostrc [at] gmail [dot] com>
# Contributor: Denis Martinez <deuns.martinez [at] gmail [dot] com>

pkgname=lib32-tbb
pkgver=2021.5.0
pkgrel=1
pkgdesc="High level abstract threading library (32-bit)"
arch=('x86_64')
url="https://threadingbuildingblocks.org"
license=('Apache')
depends=("${pkgname#lib32-}" 'lib32-gcc-libs' 'lib32-hwloc')
makedepends=('cmake' 'ninja')
provides=('lib32-intel-tbb')
conflicts=('lib32-intel-tbb')
replaces=('lib32-intel-tbb')
source=("${pkgname#lib32-}-${pkgver}.tar.gz::https://github.com/oneapi-src/oneTBB/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('0e7b71022e397a6d7abb0cea106847935ae79a1e12a6976f8d038668c6eca8775ed971202c5bd518f7e517092b67af805cc5feb04b5c3a40e9fbf972cc703a46')

build() {
  cd "oneTBB-${pkgver}"
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'
  cmake -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
    -DCMAKE_C_FLAGS=-m32 \
    -DCMAKE_CXX_FLAGS=-m32 \
    -DCMAKE_SHARED_LINKER_FLAGS=-m32 \
    .
  ninja
}

check() {
  cd "oneTBB-${pkgver}"
  ninja test
}

package() {
  cd "oneTBB-${pkgver}"
  DESTDIR="$pkgdir" ninja install
  rm -rf "${pkgdir}/usr/"{include,share}
}
