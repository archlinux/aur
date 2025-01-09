# Maintainer: Jiri Pospisil <jiri@jpospisil.com>

pkgname=llvm-libunwind
pkgver=18.1.8
pkgrel=1
pkgdesc='LLVM'\''s libunwind library'
url='https://github.com/llvm/llvm-project/tree/main/libunwind'
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz")
arch=('x86_64')
makedepends=('clang' 'cmake' 'ninja' 'python')
options=('!lto')
license=('custom:Apache 2.0 with LLVM Exception')
b2sums=('a950492f1dbfb874dff63b1ffef86468169ba2f211a9733ec2d4cf30040f7f277ef00f048bb44dee9f97d7d762f0f241f19e5a2a7b0b49217d3821ddfc8c354f')

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
