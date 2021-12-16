# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Peter Lamby <peterlamby [at] web [dot] de>
# Contributor: Stéphane Gaudreault <stephane [at] archlinux [dot] org>
# Contributor: Thomas Dziedzic <gostrc [at] gmail [dot] com>
# Contributor: Denis Martinez <deuns.martinez [at] gmail [dot] com>

pkgname=lib32-tbb
pkgver=2021.4.0
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
sha512sums=('96da2bc351fd64dfa854f8e6cabc1c4e53af3d55760e99d6f83ad53779c727af333d13d6be0828ed70371cf796498d2063e9dd0e4b2f6451623bb5d28ccbf20b')

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
