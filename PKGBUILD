# Maintainer: Alex Reinking <alex.reinking@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Jon Noble <jonnobleuk@gmail.com>
pkgname=halide-git
pkgver=23.0.0.dev0.r9.gf79451625
pkgrel=1
pkgdesc="A language for fast and portable data-parallel computation (git main)"
arch=('x86_64')
url="https://halide-lang.org/"
license=('MIT')
depends=('llvm-libs' 'flatbuffers' 'bash')
makedepends=('git' 'cmake' 'ninja' 'llvm' 'clang')
optdepends=(
  'cuda: NVidia PTX backend.'
  'libpng: PNG support in the Image IO Utility.'
  'libjpeg-turbo: JPEG support in the Image IO Utility.')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
source=("Halide::git+https://github.com/halide/Halide.git")
sha256sums=('SKIP')

pkgver() {
  cd Halide
  git describe --long --tags --abbrev=9 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S Halide \
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
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 Halide/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
