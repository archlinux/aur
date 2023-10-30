# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=llvm-libunwind
pkgver=16.0.6
pkgrel=1
pkgdesc='LLVM'\''s libunwind library'
url='https://github.com/llvm/llvm-project/tree/main/libunwind'
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz")
arch=('x86_64')
makedepends=('clang' 'cmake' 'ninja')
options=('!lto')
license=('custom:Apache 2.0 with LLVM Exception')
b2sums=('95192d39cbd2914e5609db365965f1c00bfea6c2d653b3996bd2acef8a2b37e37f6fc8a9d2b65711ad72657e0ef52c42f733053cf65051e7822f27396c30406d')

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
