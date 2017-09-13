# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Mihails Strasuns <public [at] dicebot [dot] lv>
# Contributor: Sven-Hendrik Haase <sh [at] lutzhaase [dot] com>

pkgname=lib32-liblphobos
pkgver=1.4.0
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
source=("$url/releases/download/v${pkgver}/ldc-${pkgver}-src.tar.gz")
sha256sums=('dd29a5833ae02307c387e87d861d5de588b9b16ea3574ef96f8da1f81bbd7c5c')

build() {
  cd ldc-$pkgver-src

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

  make
}

package() {
  cd ldc-$pkgver-src/build

  # Libraries
  install -D -m644 ./lib32/libphobos2-ldc.so $pkgdir/usr/lib32/liblphobos2.so
  install -D -m644 ./lib32/libdruntime-ldc.so $pkgdir/usr/lib32/libldruntime.so
  install -D -m644 ./lib32/libphobos2-ldc-debug.so $pkgdir/usr/lib32/liblphobos2-debug.so
  install -D -m644 ./lib32/libdruntime-ldc-debug.so $pkgdir/usr/lib32/libldruntime-debug.so

  # License
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
