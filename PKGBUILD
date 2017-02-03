# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Mihails Strasuns <public [at] dicebot [dot] lv>
# Contributor: Sven-Hendrik Haase <sh [at] lutzhaase [dot] com>

pkgname=lib32-liblphobos
pkgver=1.1.0
pkgrel=1
pkgdesc="Runtime and Phobos library for the LLVM based D compiler. (32-bit)"
arch=('x86_64')
url="https://github.com/ldc-developers/ldc"
license=('BSD')
groups=('dlang' 'dlang-ldc')
depends=('ldc' 'lib32-curl' 'lib32-gcc-libs')
makedepends=('git' 'llvm' 'libconfig' 'cmake')
provides=("d-runtime" "d-stdlib")
replaces=("lib32-liblphobos-devel")
source=("git+$url#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd ldc

  git submodule update --init --recursive

  [ -d build ] || mkdir build
  cd build

  cmake \
    -DMULTILIB=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DINCLUDE_INSTALL_DIR=/usr/include/dlang/ldc \
    -DBUILD_SHARED_LIBS=ON \
    ..

  make -j 4
}

package() {
  # Libraries
  install -D -m644 $srcdir/ldc/build/lib32/libphobos2-ldc.so $pkgdir/usr/lib32/liblphobos2.so
  install -D -m644 $srcdir/ldc/build/lib32/libdruntime-ldc.so $pkgdir/usr/lib32/libldruntime.so
  install -D -m644 $srcdir/ldc/build/lib32/libphobos2-ldc-debug.so $pkgdir/usr/lib32/liblphobos2-debug.so
  install -D -m644 $srcdir/ldc/build/lib32/libdruntime-ldc-debug.so $pkgdir/usr/lib32/libldruntime-debug.so

  # License
  install -D -m644 "${srcdir}/ldc/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
