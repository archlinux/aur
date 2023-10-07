# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=mingw-w64-corrosion
pkgver=0.4.4
pkgrel=1
pkgdesc="Tool for integrating Rust into an existing CMake project (MinGW-w64)"
arch=('any')
url="https://github.com/corrosion-rs/corrosion"
license=('MIT')
depends=('rust' 'cmake')
source=("https://github.com/corrosion-rs/corrosion/archive/v$pkgver/${pkgname#mingw-w64-}-$pkgver.tar.gz")
sha256sums=('bf3981d0e066f2c877949ec59d9ed6cb193ae4ff615b73f20c64a5de68fc06ab')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    cmake -S "${pkgname#mingw-w64-}-$pkgver" -B build/$_arch \
      -DCMAKE_INSTALL_PREFIX=/usr/$_arch \
      -DCMAKE_INSTALL_LIBEXECDIR=lib \
      -DCMAKE_BUILD_TYPE=Release \
      -DCORROSION_BUILD_TESTS=OFF

    cmake --build build/$_arch --config Release
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install build/$_arch --config Release
  done
  install -Dm644 "${pkgname#mingw-w64-}"-$pkgver/LICENSE -t "${pkgdir}"/usr/share/licenses/$pkgname
}
