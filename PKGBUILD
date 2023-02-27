# Maintainer: Sprite <SpriteOvO AT gmail DOT com>

pkgbase="circt"
pkgname=('firtool')
pkgdesc="Circuit IR Compilers and Tools"
pkgver="1.32.0"
_llvm_commit="9305b63d695123b9e8bc5e7a568ab890dcf9514b"
pkgrel=1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=(
  'git'
  'cmake'
  'ninja'
  'python-psutil'
)
depends=(
  'ncurses'
)
source=(
  "https://github.com/llvm/circt/archive/firtool-$pkgver.tar.gz"
  "git+https://github.com/llvm/llvm-project.git#commit=$_llvm_commit"
)
sha256sums=('8dd4d4691251b4e2062e80c50f6f4bb93fcabdd2fe3774098ab58fcca65eed73'
            'SKIP')

prepare() {
  mkdir $srcdir/build
}

build() {
  cd $srcdir/build
  cmake \
    -G Ninja \
    -S "$srcdir/llvm-project/llvm" \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D BUILD_SHARED_LIBS=OFF \
    -D LLVM_BINUTILS_INCDIR="/usr/include" \
    -D LLVM_ENABLE_PROJECTS=mlir \
    -D LLVM_STATIC_LINK_CXX_STDLIB=ON \
    -D LLVM_ENABLE_ASSERTIONS=ON \
    -D LLVM_BUILD_EXAMPLES=OFF \
    -D LLVM_ENABLE_BINDINGS=OFF \
    -D LLVM_ENABLE_OCAMLDOC=OFF \
    -D LLVM_OPTIMIZED_TABLEGEN=ON \
    -D LLVM_EXTERNAL_PROJECTS=circt \
    -D LLVM_EXTERNAL_CIRCT_SOURCE_DIR="$srcdir/circt-firtool-$pkgver" \
    -D LLVM_BUILD_TOOLS=ON \
    -D CIRCT_LLHD_SIM_ENABLED=OFF
  ninja
}

check() {
  cd $srcdir/build
  ninja check-circt
  ninja check-circt-integration
}

package_firtool() {
  install -Dm644 "$srcdir/llvm-project/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/llvm-LICENSE"
  install -Dm644 "$srcdir/llvm-project/mlir/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/mlir-LICENSE"
  install -Dm644 "$srcdir/circt-firtool-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/circt-LICENSE"
  install -Dm755 "$srcdir/build/bin/firtool" "$pkgdir/usr/bin/firtool"
}
