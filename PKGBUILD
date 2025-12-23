# Maintainer: Jiri Pospisil <jiri@jpospisil.com>

pkgname=llvm-libunwind
pkgver=21.1.8
pkgrel=1
pkgdesc='LLVM'\''s libunwind library'
url='https://github.com/llvm/llvm-project/tree/main/libunwind'
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz")
arch=('x86_64')
makedepends=('clang' 'cmake' 'ninja' 'python')
options=('!lto')
license=('custom:Apache 2.0 with LLVM Exception')
sha256sums=('4633a23617fa31a3ea51242586ea7fb1da7140e426bd62fc164261fe036aa142')

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
