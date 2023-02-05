# Maintainer: Jiuyang Liu <liu@jiuyang.me>

pkgbase="circt-git"
pkgname=('firtool-git')
pkgdesc="Circuit IR Compilers and Tools"
pkgver=r4396.ce85204ca
pkgrel=1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=(
  'git'
  'cmake'
  'ninja'
  'python'
)
depends=(
  'ncurses'
)
source=(
  "git+https://github.com/llvm/llvm-project.git"
  "git+https://github.com/llvm/circt.git"
)

md5sums=('SKIP'
         'SKIP')
sha512sums=('SKIP'
            'SKIP')
options=('staticlibs')

pkgver() {
    cd $srcdir/circt
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/circt
  git submodule init
  git config submodule."llvm".url "${srcdir}/llvm-project"
  git submodule update
  mkdir $srcdir/build
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake \
    -G Ninja \
    -S $srcdir/circt/llvm/llvm \
    -B $srcdir/build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D LLVM_BINUTILS_INCDIR=/usr/include \
    -D LLVM_ENABLE_PROJECTS=mlir \
    -D BUILD_SHARED_LIBS=OFF \
    -D LLVM_STATIC_LINK_CXX_STDLIB=ON \
    -D LLVM_ENABLE_ASSERTIONS=ON \
    -D LLVM_BUILD_EXAMPLES=OFF \
    -D LLVM_ENABLE_BINDINGS=OFF \
    -D LLVM_ENABLE_OCAMLDOC=OFF \
    -D LLVM_OPTIMIZED_TABLEGEN=ON \
    -D LLVM_EXTERNAL_PROJECTS=circt \
    -D LLVM_EXTERNAL_CIRCT_SOURCE_DIR=$srcdir/circt \
    -D LLVM_BUILD_TOOLS=ON
  ninja -C $srcdir/build firtool
}

check() {
  #ninja -C $srcdir/build check-circt-firtool
  echo "todo"
}

package_firtool-git() {
  install -Dm644 $srcdir/circt/llvm/llvm/LICENSE.TXT $pkgdir/usr/share/licenses/$pkgname/llvm-LICENSE
  install -Dm644 $srcdir/circt/llvm/mlir/LICENSE.TXT $pkgdir/usr/share/licenses/$pkgname/mlir-LICENSE
  install -Dm644 $srcdir/circt/LICENSE $pkgdir/usr/share/licenses/$pkgname/circt-LICENSE
  install -Dm755 $srcdir/build/bin/firtool $pkgdir/usr/bin/firtool
}
