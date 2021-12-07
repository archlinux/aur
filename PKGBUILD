# Maintainer: Omar Emara <mail@OmarEmara.dev>
pkgname=halide
pkgver=13.0.1
pkgrel=1
pkgdesc="A language for fast and portable data-parallel computation."
arch=('x86_64')
url="https://halide-lang.org/"
license=('MIT')
depends=('llvm' 'lld')
makedepends=('cmake' 'ninja' 'git' 'clang')
optdepends=(
  'cuda: NVidia PTX backend.'
  'emscripten: WebAssembly backend.'
  'libpng: PNG support in the Image IO Utility.'
  'libjpeg: JPEG support in the Image IO Utility.')
source=("git+https://github.com/halide/Halide.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cmake -B build -S Halide \
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
  install -Dm644 "Halide/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
