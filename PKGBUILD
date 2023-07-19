# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Peter Lamby <peterlamby [at] web [dot] de>
# Contributor: Stéphane Gaudreault <stephane [at] archlinux [dot] org>
# Contributor: Thomas Dziedzic <gostrc [at] gmail [dot] com>
# Contributor: Denis Martinez <deuns.martinez [at] gmail [dot] com>

pkgname=lib32-onetbb
pkgver=2021.9.0
pkgrel=1
pkgdesc="High level abstract threading library (oneAPI Threading Building Blocks) (32-bit)"
arch=('x86_64')
url="https://oneapi-src.github.io/oneTBB/"
license=('Apache')
depends=("${pkgname#lib32-}" 'lib32-gcc-libs' 'lib32-hwloc')
makedepends=('cmake' 'ninja')
provides=("lib32-intel-tbb=$pkgver" "lib32-tbb=$pkgver")
conflicts=('lib32-intel-tbb' 'lib32-tbb')
replaces=('lib32-intel-tbb' 'lib32-tbb')
source=("https://github.com/oneapi-src/oneTBB/archive/v$pkgver/${pkgname#lib32-}-$pkgver.tar.gz"
        "${pkgname#lib32-}-gcc13.patch::https://github.com/oneapi-src/oneTBB/commit/154cc73ca4d359621202399cc0c3c91058e56e79.patch")
sha512sums=('2ece7f678ad7c8968c0ad5cda9f987e4b318c6d9735169e1039beb0ff8dfca18815835875211acc6c7068913d9b0bdd4c9ded22962b0bb48f4a0ce0f7b78f31c'
            '31feea5ede2df7d09062435abbfa923be0bbe5b5e05a2a819ccd29cf00486d60b5e0775f29c933fea7df1df4412da8586fa12ce4bfa8a332bc6ac03b051bae23')

prepare() {
  cd oneTBB-$pkgver
  patch -Np1 -i ../${pkgname#lib32-}-gcc13.patch
}

build() {
  cd oneTBB-$pkgver
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'
  cmake -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
    -DCMAKE_C_FLAGS=-m32 \
    -DCMAKE_CXX_FLAGS=-m32 \
    -DCMAKE_SHARED_LINKER_FLAGS=-m32 \
    -DTBB_STRICT=OFF \
    .
  ninja
}

check() {
  cd oneTBB-$pkgver
  ninja test
}

package() {
  cd oneTBB-$pkgver
  DESTDIR="$pkgdir" ninja install
  rm -rf "${pkgdir}/usr/"{include,share}
}
