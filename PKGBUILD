# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=llvm-libunwind
pkgver=17.0.6
pkgrel=1
pkgdesc='LLVM'\''s libunwind library'
url='https://github.com/llvm/llvm-project/tree/main/libunwind'
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz")
arch=('x86_64')
makedepends=('clang' 'cmake' 'ninja' 'python')
options=('!lto')
license=('custom:Apache 2.0 with LLVM Exception')
b2sums=('d6ede1a9fda8756995c3e0654111941649e15794179641806f18919f1dc68c41ca0cabd5693b5096d05dccc3a391cd20d34af1137bf8af92ed3117a1ce84d1b2')

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
