# Maintainer: Omar Emara <mail@OmarEmara.dev>
pkgname=halide
pkgver=14.0.0
pkgrel=1
pkgdesc="A language for fast and portable data-parallel computation."
arch=('x86_64')
url="https://halide-lang.org/"
license=('MIT')
depends=('llvm' 'lld')
makedepends=('cmake' 'ninja' 'clang')
optdepends=(
  'cuda: NVidia PTX backend.'
  'emscripten: WebAssembly backend.'
  'libpng: PNG support in the Image IO Utility.'
  'libjpeg: JPEG support in the Image IO Utility.')
source=("https://github.com/halide/Halide/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
  cmake -B build -S "Halide-$pkgver" \
    -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_DATADIR=share/Halide \
    -DHalide_SHARED_LLVM=YES \
    -DWITH_TESTS=OFF \
    -DWITH_TUTORIALS=OFF \
    -DWITH_PYTHON_BINDINGS=OFF \
    -Wno-dev
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "Halide-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
