# Maintainer: Jiuyang Liu <liu@jiuyang.me>
# Maintainer: SpriteOvO <SpriteOvO AT gmail DOT com>

pkgbase="circt-git"
pkgname=('firtool-git')
pkgdesc="Circuit IR Compilers and Tools"
pkgver=r5724.f7963642b
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
  "git+https://github.com/llvm/llvm-project.git"
  "git+https://github.com/llvm/circt.git"
)
sha512sums=('SKIP'
            'SKIP')

pkgver() {
    cd $srcdir/circt
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/circt
  git submodule init
  git config submodule."llvm".url "${srcdir}/llvm-project"
  git -c protocol.file.allow=always submodule update
  mkdir $srcdir/build
}

build() {
  # export CFLAGS+=" ${CPPFLAGS}"
  # export CXXFLAGS+=" ${CPPFLAGS}"
  cd $srcdir/build
  cmake \
    -G Ninja \
    -S $srcdir/circt/llvm/llvm \
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
    -D LLVM_BUILD_TOOLS=ON \
    -D CIRCT_LLHD_SIM_ENABLED=OFF
  ninja
}

check() {
  cd $srcdir/build
  ninja check-circt
  ninja check-circt-integration
}

package_firtool-git() {
  install -Dm644 $srcdir/circt/llvm/llvm/LICENSE.TXT $pkgdir/usr/share/licenses/$pkgname/llvm-LICENSE
  install -Dm644 $srcdir/circt/llvm/mlir/LICENSE.TXT $pkgdir/usr/share/licenses/$pkgname/mlir-LICENSE
  install -Dm644 $srcdir/circt/LICENSE $pkgdir/usr/share/licenses/$pkgname/circt-LICENSE
  install -Dm755 $srcdir/build/bin/firtool $pkgdir/usr/bin/firtool
}
