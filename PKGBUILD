# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Mihails Strasuns <public [at] dicebot [dot] lv>
# Contributor: Sven-Hendrik Haase <sh [at] lutzhaase [dot] com>

pkgname=lib32-liblphobos
pkgver=1.28.1
pkgrel=1
pkgdesc="Runtime and Phobos library for the LLVM based D compiler. (32-bit)"
arch=('x86_64')
url="https://github.com/ldc-developers/ldc"
license=('BSD')
groups=('dlang' 'dlang-ldc')
depends=('ldc' 'lib32-curl' 'lib32-gcc-libs')
makedepends=('cmake' 'git' 'llvm' 'libconfig' 'ninja')
provides=("d-runtime" "d-stdlib")
replaces=("lib32-liblphobos-devel")
source=("${url}/releases/download/v${pkgver}/ldc-${pkgver}-src.tar.gz")
sha256sums=('654958bca5378cd97819f2ef61d3f220aa652a9d2b5ff41d6f2109302ae6eb94')

build() {
  mkdir -p ldc-$pkgver-src/build
  cd ldc-$pkgver-src/build

  cmake -GNinja \
    -DMULTILIB=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DINCLUDE_INSTALL_DIR=/usr/include/dlang/ldc \
    -DBUILD_SHARED_LIBS=ON \
    ..
  ninja
}

check() {
  cd ldc-$pkgver-src/build
  ninja all-test-runners
}

package() {
  cd ldc-$pkgver-src/build
  DESTDIR="$pkgdir" ninja install

  # Remove conflicting files.
  rm -rf "$pkgdir"/{etc,usr/{bin,include,lib}}

  # License
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
