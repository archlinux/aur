# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Mihails Strasuns <public [at] dicebot [dot] lv>
# Contributor: Sven-Hendrik Haase <sh [at] lutzhaase [dot] com>

pkgname=lib32-liblphobos
groups=('dlang' 'dlang-ldc')
provides=("d-runtime" "d-stdlib")
replaces=("lib32-liblphobos-devel")
pkgver=v1.1.0.beta3.r156.ga95f90f5
pkgrel=1
pkgdesc="D standard library (libphobos) for LDC compiler (32-bit)"
arch=('x86_64')
url="https://github.com/ldc-developers/ldc"
license=('BSD')
depends=('ldc' 'lib32-curl' 'lib32-gcc-libs')
makedepends=('git' 'llvm' 'libconfig' 'cmake')
#source=("git+$url#tag=v${pkgver}")
_commit=bb3e16481c14cf2bf161d9ff0e396500ab373ddb
source=("git+$url#tag=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd ldc
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

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
  cd ldc/build
  make install DESTDIR=$pkgdir
  rm -rf "${pkgdir}"/{etc,usr/{bin,include,lib,share}}

  # License
  install -D -m644 "${srcdir}/ldc/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
