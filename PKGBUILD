# Maintainer: George Hilliard <me@thirtythreeforty.net>
pkgname=chipstar-git
pkgver=chipStarr1.2.RC1.26.g740a14f3
pkgrel=1
pkgdesc="A tool for compiling and running HIP/CUDA on SPIR-V via OpenCL or Level Zero APIs."
arch=('x86_64')
url="https://github.com/CHIP-SPV/chipStar"
license=('MIT')
depends=('llvm' 'clang' 'spirv-llvm-translator' 'opencl-icd-loader' 'level-zero-loader')
makedepends=('git' 'cmake' 'level-zero-headers' 'opencl-headers')
provides=('chipstar')
conflicts=('chipstar')

source=("git+https://github.com/CHIP-SPV/chipStar.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/chipStar"
  git describe --tags | sed 's/^v//;s/-/r/;s/-/./g'
}

prepare() {
  cd "$srcdir/chipStar"
  git submodule update --init --recursive
  cd bitcode/ROCm-Device-Libs/
  git checkout origin/llvm-prepare-builtins
}

build() {
  cd "$srcdir/chipStar"
  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/opt/chipstar \
    -DCMAKE_BUILD_TYPE=Release \
    -DCHIP_BUILD_SAMPLES=OFF \
    -DCHIP_BUILD_TESTS=OFF

  cmake --build . --parallel
}

package() {
  # TODO: ==> WARNING: Package contains reference to $srcdir
  cd "$srcdir/chipStar/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
