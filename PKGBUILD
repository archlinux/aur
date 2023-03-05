# _     _            _        _          _____
#| |__ | | __ _  ___| | _____| | ___   _|___ /
#| '_ \| |/ _` |/ __| |/ / __| |/ / | | | |_ \
#| |_) | | (_| | (__|   <\__ \   <| |_| |___) |
#|_.__/|_|\__,_|\___|_|\_\___/_|\_\\__, |____/
#                                  |___/

#Maintainer: blacksky3 <https://github.com/blacksky3>
#Credits: Evangelos Foutras <evangelos@foutrelis.com>
#Credits: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgbase=lib32-llvm14-minimal
pkgname=(lib32-llvm14-minimal lib32-llvm14-libs-minimal)
url='https://llvm.org/'
pkgver=14.0.0
pkgrel=1
_pkgver=14.0.0
arch=(i686 x86_64)
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=(cmake ninja lib32-libffi lib32-zlib lib32-zstd python gcc-multilib lib32-libxml2 git patch)
options=(staticlibs !lto ) # extra/llvm has many test failures with LTO
source=(https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-${pkgver}.tar.gz
        llvm-coroutines-ubsan.patch
        remove-include-linux-fs.h.patch
        clang-coroutines-ubsan.patch
        enable-fstack-protector-strong-by-default.patch
        enforce-instantiation-of-constexpr-template-functions.patch)

# Both ninja & LIT by default use all available cores. this can lead to heavy stress on systems making them unresponsive.
# It can also happen that the kernel oom killer interferes and kills important tasks.
# A reasonable value for them to avoid these issues appears to be 75% of available cores.
# NINJAFLAGS and LITFLAGS are env vars that can be used to achieve this. They should be set on command line or in files read by your shell on login (like .bashrc ) .
# example for systems with 24 cores
# NINJAFLAGS="-j 18 -l 18"
# LITFLAGS="-j 18"
# NOTE: It's your responbility to validate the value of NINJAFLAGS and LITFLAGS. If unsure, don't set it.

# Utilizing LLVM_DISTRIBUTION_COMPONENTS to avoid
# installing static libraries; inspired by Gentoo
_get_distribution_components(){
  local target
  ninja -t targets | grep -Po 'install-\K.*(?=-stripped:)' | while read -r target; do
    case $target in
      clang-libraries|distribution)
        continue
        ;;
      clang-tidy-headers)
        continue
        ;;
      clang|clangd|clang-*)
        ;;
      clang*|findAllSymbols)
        continue
        ;;
    esac
    echo $target
  done
}

prepare(){
  cd ${srcdir}/llvm-project-llvmorg-${pkgver}/llvm
  # https://github.com/llvm/llvm-project/issues/49689
  patch -Np2 -i ${srcdir}/llvm-coroutines-ubsan.patch

  cd ${srcdir}/llvm-project-llvmorg-${pkgver}/compiler-rt
  # https://github.com/llvm/llvm-project/issues/56421
  patch -Np2 -i ${srcdir}/remove-include-linux-fs.h.patch

  cd ${srcdir}/llvm-project-llvmorg-${pkgver}/clang
  patch -Np2 -i ${srcdir}/enable-fstack-protector-strong-by-default.patch
  # https://github.com/llvm/llvm-project/issues/55560
  patch -Np2 -i ${srcdir}/enforce-instantiation-of-constexpr-template-functions.patch
  # https://github.com/llvm/llvm-project/issues/49689
  patch -Np2 -i ${srcdir}/clang-coroutines-ubsan.patch

  # Attempt to convert script to Python 3
  2to3 -wn --no-diffs \
      ${srcdir}/llvm-project-llvmorg-${pkgver}/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-all-symbols.py
}

build(){
export CC='gcc -m32'
export CXX='g++ -m32'
export ASFLAGS=--32
export CFLAGS=-m32
export CXXFLAGS=-m32
export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  cd ${srcdir}/llvm-project-llvmorg-${pkgver}/llvm

  rm -rf build

  mkdir build

  cd build

  local cmake_args=(
    -G Ninja
    -DCMAKE_CXX_FLAGS:STRING=-m32
    -DCMAKE_C_FLAGS:STRING=-m32
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/opt/llvm14
    -DLLVM_LIBDIR_SUFFIX=32
    -DLLVM_BINUTILS_INCDIR=/opt/llvm14/include
    -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi)
    -DLLVM_VERSION_SUFFIX=""
    -DLLVM_APPEND_VC_REV=ON
    -DLLVM_TARGET_ARCH:STRING=i686
    -DLLVM_HOST_TRIPLE=$CHOST
    -DLLVM_DEFAULT_TARGET_TRIPLE="i686-pc-linux-gnu"
    -DLLVM_TARGETS_TO_BUILD="AMDGPU;X86"
    -DLLVM_BUILD_LLVM_DYLIB=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_ENABLE_RTTI=ON
    -DLLVM_ENABLE_FFI=ON
    -DLLVM_USE_PERF=ON
    -DLLVM_INCLUDE_BENCHMARKS=OFF
    -DLLVM_INCLUDE_EXAMPLES=OFF
    -DLLVM_BUILD_DOCS=OFF
    -DLLVM_INCLUDE_DOCS=OFF
    -DLLVM_ENABLE_SPHINX=OFF
    -DLLVM_ENABLE_OCAMLDOC=OFF
    -DLLVM_ENABLE_DOXYGEN=OFF
    -DLLVM_ENABLE_BINDINGS=OFF
    -DLLVM_ENABLE_PROJECTS="compiler-rt;clang-tools-extra;clang"
    -DCOMPILER_RT_INSTALL_PATH=/opt/llvm14/lib32/clang/$_pkgver
    -DLLVM_LIT_ARGS="$LITFLAGS"" -sv --ignore-fail"
    -Wno-dev
  )

  cmake .. "${cmake_args[@]}"
  local distribution_components=$(_get_distribution_components | paste -sd\;)
  test -n "$distribution_components"
  cmake_args+=(-DLLVM_DISTRIBUTION_COMPONENTS="$distribution_components")

  cmake .. "${cmake_args[@]}"
  ninja $NINJAFLAGS
}

package_lib32-llvm14-minimal(){
  pkgdesc='Collection of modular and reusable compiler and toolchain technologies (32-bit)'
  depends=(lib32-llvm14-libs-minimal llvm14-minimal)
  provides=(lib32-llvm14 lib32-clang14 lib32-compiler-rt14 lib32-clang-analyzer14 lib32-clang-tools-extra14)

  DESTDIR="$pkgdir" ninja $NINJAFLAGS -C ${srcdir}/llvm-project-llvmorg-${pkgver}/llvm/build install
  DESTDIR="$pkgdir" ninja $NINJAFLAGS -C ${srcdir}/llvm-project-llvmorg-${pkgver}/llvm/build install-distribution

  # The runtime library goes into lib32-llvm-libs
  mv "$pkgdir"/opt/llvm14/lib32/lib{LLVM,LTO,Remarks}*.so* "$srcdir"
  mv -f "$pkgdir"/opt/llvm14/lib32/LLVMgold.so "$srcdir"

  # Fix permissions of static libs
  chmod -x "$pkgdir"/opt/llvm14/lib32/*.a

  mv "$pkgdir/opt/llvm14/bin/llvm-config" "$pkgdir/opt/llvm14/lib32/llvm-config"
  mv "$pkgdir/opt/llvm14/include/llvm/Config/llvm-config.h" "$pkgdir/opt/llvm14/lib32/llvm-config-32.h"

  rm -rf "$pkgdir"/opt/llvm14/{bin,include,lib,libexec,share}

  # Needed for multilib (https://bugs.archlinux.org/task/29951)
  # Header stub is taken from Fedora
  install -d "$pkgdir/opt/llvm14/include/llvm/Config"
  mv "$pkgdir/opt/llvm14/lib32/llvm-config-32.h" "$pkgdir/opt/llvm14/include/llvm/Config/"

  mkdir "$pkgdir"/opt/llvm14/bin
  mv "$pkgdir/opt/llvm14/lib32/llvm-config" "$pkgdir/opt/llvm14/bin/llvm-config32"

  # link to /opt/llvm14/lib32
  install -d "$pkgdir/usr/lib32"
  ln -s /opt/llvm14/lib32/libclang.so.14 "$pkgdir"/usr/lib32/libclang.so.14
  ln -s /opt/llvm14/lib32/libclang-cpp.so.14 "$pkgdir"/usr/lib32/libclang-cpp.so.14

  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/llvm/LICENSE"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/CREDITS.TXT" "$pkgdir/usr/share/licenses/$pkgname/llvm/CREDITS"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/CODE_OWNERS.TXT" "$pkgdir/usr/share/licenses/$pkgname/llvm/CODE_OWNERS"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/clang/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/clang/LICENSE"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/clang/CODE_OWNERS.TXT" "$pkgdir/usr/share/licenses/$pkgname/clang/CODE_OWNERS"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/clang-tools-extra/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/clang-tools-extra/LICENSE"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/clang-tools-extra/CODE_OWNERS.TXT" "$pkgdir/usr/share/licenses/$pkgname/clang-tools-extra/CODE_OWNERS"
  install -Dm644 "${srcdir}/llvm-project-llvmorg-${pkgver}/compiler-rt/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/compiler-rt/LICENSE"
  install -Dm644 "${srcdir}/llvm-project-llvmorg-${pkgver}/compiler-rt/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/compiler-rt/LICENSE"
}

package_lib32-llvm14-libs-minimal(){
  pkgdesc='Low Level Virtual Machine (runtime library) (32-bit)'
  depends=(lib32-libffi lib32-zlib lib32-zstd lib32-ncurses lib32-libxml2 lib32-gcc-libs)
  provides=(lib32-llvm14-libs)

  install -d "$pkgdir/opt/llvm14/lib32"

  cp -P \
    "$srcdir"/lib{LLVM,LTO,Remarks}*.so* \
    "$srcdir"/LLVMgold.so \
    "$pkgdir/opt/llvm14/lib32/"

  # Symlink LLVMgold.so from /usr/lib/bfd-plugins
  # https://bugs.archlinux.org/task/28479
  install -d "$pkgdir/opt/llvm14/lib32/bfd-plugins"
  ln -s ../LLVMgold.so "$pkgdir/opt/llvm14/lib32/bfd-plugins/LLVMgold.so"

  # link to /opt/llvm14/lib32
  install -d "$pkgdir/usr/lib32"
  ln -s /opt/llvm14/lib32/libLLVM-14.0.0.so "$pkgdir"/usr/lib32/libLLVM-14.0.0.so
  ln -s /opt/llvm14/lib32/libLLVM-14.so "$pkgdir"/usr/lib32/libLLVM-14.so
  ln -s /opt/llvm14/lib32/libLTO.so.14 "$pkgdir"/usr/lib32/libLTO.so.14
  ln -s /opt/llvm14/lib32/libRemarks.so.14 "$pkgdir"/usr/lib32/libRemarks.so.14

  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/CREDITS.TXT" "$pkgdir/usr/share/licenses/$pkgname/CREDITS"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/CODE_OWNERS.TXT" "$pkgdir/usr/share/licenses/$pkgname/CODE_OWNERS"
}

sha256sums=('87b1a068b370df5b79a892fdb2935922a8efb1fddec4cc506e30fe57b6a1d9c4'
            'ee9baf6df05474083857044d92f26f59d3ee709cdf82ba3bdb2792e6645f71d9'
            '34ed866e313e4580130a50118a4410d36fa0159123982521b6ef049439fc32ad'
            '2c25ddf0ba6be01949842873fef4d285456321aaccd4ba95db61b69a4c580106'
            '7a9ce949579a3b02d4b91b6835c4fb45adc5f743007572fb0e28e6433e48f3a5'
            'eb2916131ae63b3bd1689f6a27dc0c2fadad73a5c5f2c828062c8a2c547e4a0d')
