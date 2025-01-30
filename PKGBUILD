# Maintainer: krn1pnc <krn1pnc@outlook.com>

pkgname=clangd-aosopt
pkgver=19.1.7
pkgrel=1
pkgdesc="Standalone clangd binary, with a rough patch that fixes performance issue with large array of structure"
arch=("x86_64")
url="https://clangd.llvm.org/"
license=("Apache-2.0 WITH LLVM-exception")
depends=("ncurses" "zstd")
makedepends=("cmake" "ninja")
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/llvm-project-${pkgver}.src.tar.xz"
        "array-of-structure-optimization.patch")
sha256sums=("82401fea7b79d0078043f7598b835284d6650a75b93e64b6f761ea7b63097501"
            "75ff0b4f4df0cee76903ef4a43ac3ec6c9e5eb173d4fd738ab9f923d787c60b5")
OPTIONS=(strip !debug)

prepare() {
    cd ${srcdir}/llvm-project-${pkgver}.src
    patch -p1 -i ../array-of-structure-optimization.patch
}

build() {
    cd ${srcdir}/llvm-project-${pkgver}.src
    cmake -B build \
          -S llvm \
          -G Ninja \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/opt/clangd-aosopt \
          -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra"
    cmake --build build --target clangd
}

package() {
    cd ${srcdir}/llvm-project-${pkgver}.src/build
    cmake --install . --prefix ${pkgdir}/opt/clangd-aosopt --component clangd
    mkdir ${pkgdir}/opt/clangd-aosopt/lib/ && cp -r lib/clang ${pkgdir}/opt/clangd-aosopt/lib/clang
}
