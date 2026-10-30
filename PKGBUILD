# Maintainer: Omar Emara <mail@OmarEmara.dev>
# Maintainer: Alex Reinking <alex.reinking@gmail.com>
pkgname=halide
pkgver=22.1.0
pkgrel=1
pkgdesc="A language for fast and portable data-parallel computation."
arch=('x86_64')
url="https://halide-lang.org/"
license=('MIT')
depends=('llvm-libs' 'flatbuffers')
makedepends=('cmake' 'ninja' 'llvm' 'clang')
optdepends=(
  'cuda: NVidia PTX backend.'
  'emscripten: WebAssembly backend.'
  'libpng: PNG support in the Image IO Utility.'
  'libjpeg-turbo: JPEG support in the Image IO Utility.')
source=("https://github.com/halide/Halide/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('35b59f91be6189645abf33078b1954740a434d97aaeaeaf5f15d162d86b74f6e')

build() {
  cmake -B build -S "Halide-$pkgver" \
    -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_DATADIR=share/Halide \
    -DHalide_LLVM_SHARED_LIBS=YES \
    -DHalide_WASM_BACKEND=OFF \
    -DWITH_TESTS=OFF \
    -DWITH_TUTORIALS=OFF \
    -DWITH_PYTHON_BINDINGS=OFF \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -Wno-dev
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "Halide-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
