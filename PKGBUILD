# Maintainer: krn1pnc <krn1pnc@outlook.com>

pkgname=clangd-aosopt
pkgver=21.1.6
pkgrel=1
pkgdesc="Standalone clangd binary, with a rough patch that fixes performance issue with large array of structure"
arch=("x86_64")
url="https://clangd.llvm.org/"
license=("Apache-2.0 WITH LLVM-exception")
depends=("ncurses" "zstd")
makedepends=("cmake" "ninja")
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/llvm-project-${pkgver}.src.tar.xz"
        "array-of-structure-optimization.patch")
sha256sums=("ae67086eb04bed7ca11ab880349b5f1ab6f50e1b88cda376eaf8a845b935762b"
            "860bd0c9e0c0ad56d28146e09ccca012200dfdaa106e6db57e5c21f3e03fa0ce")
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
