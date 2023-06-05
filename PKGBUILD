# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=llvm-libunwind
pkgver=15.0.7
pkgrel=1
pkgdesc='LLVM'\'' libunwind library'
url='https://github.com/llvm/llvm-project/tree/main/libunwind'
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz")
arch=('x86_64')
makedepends=('clang' 'cmake' 'ninja')
options=('!lto')
license=('custom:Apache 2.0 with LLVM Exception')
b2sums=('f3d277e2029157329e5be78b78af36b0826a1dfd9a337992499bf701e33149665bfc47d5e14978e38f342559629a559f8b2ce328705ba34fdf6830f5ae9721a5')

build() {
  cd "$srcdir/llvm-project-$pkgver.src"
  mkdir -p build
  cd build

  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DLLVM_ENABLE_RUNTIMES='libunwind' \
    -DLLVM_ENABLE_PIC=ON \
    ../runtimes

  ninja unwind
}

package() {
  cd "$srcdir/llvm-project-$pkgver.src/build/lib"

  # Cherry pick the files as to not overwrite any other already install libunwind versions...
  install -Dm755 libunwind.so.1.0 "$pkgdir/usr/lib/libunwind.so.1.0"
  ln -sr "$pkgdir/usr/lib/libunwind.so.1.0" "$pkgdir/usr/lib/libunwind.so.1"

  install -Dm644 "../../libunwind/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
