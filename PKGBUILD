# Maintainer: Tarn W. Burton <twburton@gmail.com>

pkgname=('llvm13')
pkgver=13.0.0.r395292.d7b669b3a303
pkgrel=1
pkgdesc="Low Level Virtual Machine 13 for clasp"
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('cmake' 'libffi' 'libedit' 'ncurses' 'libxml2')
options=('staticlibs')
source=("llvm-project::git+https://github.com/llvm/llvm-project.git#tag=llvmorg-13.0.0")
md5sums=('SKIP')
sha512sums=('SKIP')


pkgver() {
  cd llvm-project/llvm

  # This will almost match the output of `llvm-config --version` when the
  # LLVM_APPEND_VC_REV cmake flag is turned on. The only difference is
  # dash being replaced with underscore because of Pacman requirements.
  local _pkgver=$(awk -F 'MAJOR |MINOR |PATCH |)' \
          'BEGIN { ORS="." ; i=0 } \
           /set\(LLVM_VERSION_/ { print $2 ; i++ ; if (i==2) ORS="" } \
           END { print "\n" }' \
           CMakeLists.txt).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
  echo "$_pkgver"
}

build() {
  mkdir -p build
  cd build

  cmake -G "Unix Makefiles" \
  -DLLVM_BINUTILS_INCDIR=/usr/local/opt/binutils/include \
  -DLLVM_ABI_BREAKING_CHECKS=FORCE_OFF \
  -DLINK_POLLY_INTO_TOOLS=ON \
  -DLLVM_BUILD_EXTERNAL_COMPILER_RT=ON \
  -DLLVM_BUILD_LLVM_DYLIB=ON \
  -DLLVM_ENABLE_ASSERTIONS=ON \
  -DLLVM_ENABLE_EH=ON \
  -DLLVM_ENABLE_FFI=ON \
  -DLLVM_ENABLE_LIBCXX=ON \
  -DLLVM_ENABLE_RTTI=ON \
  -DLLVM_INCLUDE_DOCS=OFF \
  -DLLVM_INSTALL_UTILS=ON \
  -DLLVM_OPTIMIZED_TABLEGEN=ON \
  -DLLVM_TARGETS_TO_BUILD=X86 \
  -DLLVM_ENABLE_PROJECTS=clang\;compiler-rt\;libcxxabi\;libcxx\;lldb \
  -DCMAKE_BUILD_TYPE=Release \
  -DWITH_POLLY=ON \
  -DCMAKE_INSTALL_PREFIX=/opt/llvm13 \
  -DLLVM_CREATE_XCODE_TOOLCHAIN=ON \
  -DEXECUTION_ENGINE_USE_LLVM_UNWINDER=1 \
  ../llvm-project/llvm

  make -j 4
}

package() {
  cd build
  DESTDIR="$pkgdir" make -j 4 install
  mkdir -p "$pkgdir/etc/ld.so.conf.d/"
  echo "/opt/llvm13/lib" > "$pkgdir/etc/ld.so.conf.d/70-llvm13.conf"
}
