# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164,SC2291
# Maintainer: Toria <ninetailedtori@uwu.gal>
# Maintainer: Jiri Pospisil <jiri@jpospisil.com>

pkgname=llvm-libunwind
pkgver=$(curl -s https://gitlab.archlinux.org/archlinux/packaging/packages/llvm/-/raw/main/PKGBUILD | grep -oP "^pkgver=\K.*" | head -1)
pkgrel=1
pkgdesc='LLVM'\''s libunwind library'
url='https://github.com/llvm/llvm-project/tree/main/libunwind'
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz")
arch=('x86_64')
makedepends=(
  'clang'
  'cmake'
  'ninja'
  'python'
  'curl'
  'grep'
)
options=('!lto')
license=('custom:Apache 2.0 with LLVM Exception')
sha256sums=('dcc22709ff65301cc6c723859ab0d4b3ba0e3f98162e6cae3f90d9501422c690')

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
