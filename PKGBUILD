pkgname=llvm-c166-git
pkgver=24.0.0.r594554.g98c15be
pkgrel=1
pkgdesc='LLVM toolchain for the C166 architecture (git)'
arch=('x86_64')
url='https://github.com/siemens-mobile-hacks/llvm-c166'
license=('Apache-2.0 WITH LLVM-exception')
depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('cmake' 'git' 'ninja' 'python')
provides=('llvm-c166')
conflicts=('llvm-c166')
options=('!debug' '!lto')
source=('llvm-c166::git+https://github.com/siemens-mobile-hacks/llvm-c166.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/llvm-c166"

  local version
  version=$(sed -n \
    's/.*set(LLVM_VERSION_\(MAJOR\|MINOR\|PATCH\) \([0-9]\+\)).*/\2/p' \
    cmake/Modules/LLVMVersion.cmake | paste -sd.)

  printf '%s.r%s.g%s' \
    "$version" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  local cmake_args=(
    -G Ninja
    -DBUILTINS_c166_CMAKE_CXX_FLAGS=
    -DBUILTINS_c166_CMAKE_C_FLAGS=
    -DBUILTINS_c166_CMAKE_EXE_LINKER_FLAGS=
    -DBUILTINS_c166_CMAKE_MODULE_LINKER_FLAGS=
    -DBUILTINS_c166_CMAKE_SHARED_LINKER_FLAGS=
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm-c166
    -DCMAKE_INSTALL_RPATH=/usr/lib/llvm-c166/lib
    -DLLVM_BUILD_LLVM_DYLIB=ON
    -DLLVM_BUILTIN_TARGETS=c166
    -DLLVM_DEFAULT_TARGET_TRIPLE=c166-none-elf
    -DLLVM_DISTRIBUTION_COMPONENTS='clang;clang-cpp;clang-resource-headers;lld;LLVM;builtins;llc;opt;llvm-ar;llvm-as;llvm-dis;llvm-link;llvm-mc;llvm-nm;llvm-objcopy;llvm-objdump;llvm-ranlib;llvm-readobj;llvm-size;llvm-strings;llvm-strip'
    -DLLVM_ENABLE_BINDINGS=OFF
    -DLLVM_ENABLE_CURL=OFF
    -DLLVM_ENABLE_FFI=OFF
    -DLLVM_ENABLE_LIBEDIT=OFF
    -DLLVM_ENABLE_LIBXML2=OFF
    -DLLVM_ENABLE_PROJECTS='clang;lld'
    -DLLVM_ENABLE_RUNTIMES=
    -DLLVM_ENABLE_TERMINFO=OFF
    -DLLVM_ENABLE_ZLIB=OFF
    -DLLVM_ENABLE_ZSTD=OFF
    -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=C166
    -DLLVM_INCLUDE_BENCHMARKS=OFF
    -DLLVM_INCLUDE_DOCS=OFF
    -DLLVM_INCLUDE_EXAMPLES=OFF
    -DLLVM_INCLUDE_TESTS=OFF
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_TARGETS_TO_BUILD=
  )

  cmake -S "$srcdir/llvm-c166/llvm" -B "$srcdir/build" "${cmake_args[@]}"
  cmake --build "$srcdir/build" --target distribution
}

package() {
  DESTDIR="$pkgdir" cmake --build "$srcdir/build" --target install-distribution

  local tools=(
    clang
    clang++
    ld.lld
    llc
    opt
    llvm-ar
    llvm-as
    llvm-dis
    llvm-link
    llvm-mc
    llvm-nm
    llvm-objcopy
    llvm-objdump
    llvm-ranlib
    llvm-readobj
    llvm-size
    llvm-strings
    llvm-strip
  )

  install -d "$pkgdir/usr/bin"
  local tool
  for tool in "${tools[@]}"; do
    ln -s "../lib/llvm-c166/bin/$tool" "$pkgdir/usr/bin/c166-$tool"
  done

  install -Dm644 "$srcdir/llvm-c166/llvm/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
