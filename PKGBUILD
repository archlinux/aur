# Maintainer: krn1pnc <krn1pnc@outlook.com>

pkgname=clangd-aosopt
pkgver=20.1.8
pkgrel=1
pkgdesc="Standalone clangd binary, with a rough patch that fixes performance issue with large array of structure"
arch=("x86_64")
url="https://clangd.llvm.org/"
license=("Apache-2.0 WITH LLVM-exception")
depends=("ncurses" "zstd")
makedepends=("cmake" "ninja")
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/llvm-project-${pkgver}.src.tar.xz"
        "array-of-structure-optimization.patch")
sha256sums=("6898f963c8e938981e6c4a302e83ec5beb4630147c7311183cf61069af16333d"
            "79996c96289061079da75cbae6a71f8cfed391be4f1178ced520f1de2f6663af")
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
