# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Peter Lamby <peterlamby [at] web [dot] de>
# Contributor: Stéphane Gaudreault <stephane [at] archlinux [dot] org>
# Contributor: Thomas Dziedzic <gostrc [at] gmail [dot] com>
# Contributor: Denis Martinez <deuns.martinez [at] gmail [dot] com>

pkgname=lib32-tbb
pkgver=2021.3.0
pkgrel=1
pkgdesc="High level abstract threading library (32-bit)"
arch=('x86_64')
url="https://threadingbuildingblocks.org"
license=('Apache')
depends=("${pkgname#lib32-}" 'lib32-gcc-libs')
makedepends=('cmake' 'ninja')
provides=('lib32-intel-tbb')
conflicts=('lib32-intel-tbb')
replaces=('lib32-intel-tbb')
source=("${pkgname#lib32-}-${pkgver}.tar.gz::https://github.com/oneapi-src/oneTBB/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        tbb-gcc-11-433.patch::https://github.com/oneapi-src/oneTBB/pull/433.patch
        tbb-gcc-11-447.patch::https://github.com/oneapi-src/oneTBB/pull/447.patch)
sha512sums=('969bc8d1dcf50bd12f70633d0319e46308eb1667cdc6f0503b373a35dcb2fe6b2adf59c26bd3c8e2a99a8d2d8b9f64088db5a43e784218b163b3661d12908c0e'
            'bd6bfd46c74f45c786c20f72654b554fd20bd105c0739e2e98b17b801f07ee149581df0c4e6f8ed2111dad9da8a9361b5e532572be30604dda32d49102bdca03'
            '756faf918c56115007241e607590d1d370d45bca9313125987d739a271e022a47043f4bd4f47633c9239e1033299876899c3769d7ae17cfaefb114a5462cda95')

prepare() {
  patch -d oneTBB-$pkgver -p1 < tbb-gcc-11-433.patch
  patch -d oneTBB-$pkgver -p1 < tbb-gcc-11-447.patch
}

build() {
  cd "oneTBB-${pkgver}"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  cmake -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
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
