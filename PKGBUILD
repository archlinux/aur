# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=mingw-w64-corrosion
pkgver=0.5.0
pkgrel=1
pkgdesc="Tool for integrating Rust into an existing CMake project (MinGW-w64)"
arch=('any')
url="https://github.com/corrosion-rs/corrosion"
license=('MIT')
depends=('rust' 'cmake')
source=("https://github.com/corrosion-rs/corrosion/archive/v$pkgver/${pkgname#mingw-w64-}-$pkgver.tar.gz")
sha256sums=('bbe0d4a31cef91b890134af82789fb6e8ecc33270472beea9cecb8f2b7b7ed65')

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
