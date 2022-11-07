# Maintainer: Vaporeon <vaporeon@vaporeon.io>
pkgname=mingw-w64-corrosion
pkgver=0.3.0
_commit=6e34e10f2b6b3f0197bae6a06c82260a9775da49
pkgrel=1
pkgdesc="Tool for integrating Rust into an existing CMake project (MinGW-w64)"
arch=('any')
url="https://github.com/corrosion-rs/corrosion"
license=('MIT')
depends=('rust' 'cmake')
makedepends=('git')
source=("git+${url}.git#commit=$_commit")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    cmake -S "${pkgname#mingw-w64-}" \
      -B build/$_arch \
      -DCORROSION_BUILD_TESTS=OFF \
      -DCMAKE_INSTALL_PREFIX=/usr/$_arch \
      -DCMAKE_BUILD_TYPE=Release

    cmake --build build/$_arch --config Release
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install build/$_arch --config Release
  done
}
