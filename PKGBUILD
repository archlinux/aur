# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Mihails Strasuns <public [at] dicebot [dot] lv>
# Contributor: Sven-Hendrik Haase <sh [at] lutzhaase [dot] com>

pkgname=lib32-liblphobos
pkgver=1.13.0
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
source=("${url}/releases/download/v${pkgver}/ldc-${pkgver}-src.tar.gz")
sha256sums=('4b2fd3eb90fb6debc0ae6d70406bc78fcb531a0f20806640e626d4822e87b2e0')

build() {
  mkdir -p ldc-$pkgver-src/build
  cd ldc-$pkgver-src/build

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

check() {
  cd ldc-$pkgver-src/build
  make all-test-runners
}

package() {
  cd ldc-$pkgver-src/build
  make DESTDIR="$pkgdir" install

  # Remove conflicting files.
  rm -rf "$pkgdir"/{etc,usr/{bin,include,lib}}

  # License
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
