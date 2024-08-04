# Maintainer: Sprite <SpriteOvO AT gmail DOT com>

pkgbase="circt"
pkgname=('firtool')
pkgdesc="Circuit IR Compilers and Tools"
pkgver="1.80.0"
_llvm_commit="0870afaaaccde5b4bae37abfc982207ffafb8332"
pkgrel=1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=(
  'git'
  'cmake'
  'ninja'
  'python-psutil'
  'z3'
)
optdepends=(
  'z3'
)
source=(
  "https://github.com/llvm/circt/archive/firtool-$pkgver.tar.gz"
  "git+https://github.com/llvm/llvm-project.git#commit=$_llvm_commit"
)
sha256sums=('77e23a53e50ff66bcb43510857897b70acc1306c56941810ee3da864d6422b68'
            '2fb414bf05786dd405252b26715f50b132dd096723a017618f57ad7f7aa019a9')
options=(!lto)

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
