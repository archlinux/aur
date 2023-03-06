#_     _            _                                _____
#| |__ | | __ _  ___| | ___ __ ___   ___   ___  _ __ |___ /
#| '_ \| |/ _` |/ __| |/ / '_ ` _ \ / _ \ / _ \| '_ \  |_ \
#| |_) | | (_| | (__|   <| | | | | | (_) | (_) | | | |___) |
#|_.__/|_|\__,_|\___|_|\_\_| |_| |_|\___/ \___/|_| |_|____/

#Maintainer: blackmoon3 <https://github.com/blacksky3>
#Credits: Evangelos Foutras <evangelos@foutrelis.com>
#Credits: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgbase=lib32-llvm10-minimal
pkgname=(lib32-llvm10-minimal lib32-llvm10-libs-minimal)
url='https://llvm.org/'
pkgver=10.0.0
pkgrel=1
_pkgver=10.0.0
arch=(i686 x86_64)
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=(cmake ninja lib32-libffi lib32-zlib lib32-zstd python gcc-multilib lib32-libxml2 git patch)
options=(staticlibs !lto ) # extra/llvm has many test failures with LTO
source=(https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-${pkgver}.tar.gz
        enable-SSP-and-PIE-by-default.patch)

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
  cd ${srcdir}/llvm-project-llvmorg-${pkgver}/clang
  patch -Np2 -i ${srcdir}/enable-SSP-and-PIE-by-default.patch

  if [[ $pkgver != 10.* ]]; then
    echo "Remove libclangHandleLLVM hack!"
    return 1
  fi

  # Remove libclangHandleLLVM; breaks zig (https://reviews.llvm.org/D75579)
  sed -i '/add_clang_subdirectory(handle-llvm)/d' ${srcdir}/llvm-project-llvmorg-${pkgver}/clang/tools/clang-fuzzer/CMakeLists.txt

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
    -DCMAKE_INSTALL_PREFIX=/opt/llvm10
    -DLLVM_LIBDIR_SUFFIX=32
    -DLLVM_BINUTILS_INCDIR=/opt/llvm10/include
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
    -DCOMPILER_RT_INSTALL_PATH=/opt/llvm10/lib32/clang/$_pkgver
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

package_lib32-llvm10-minimal(){
  pkgdesc='Collection of modular and reusable compiler and toolchain technologies (32-bit)'
  depends=(lib32-llvm10-libs-minimal llvm10-minimal)
  provides=(lib32-llvm10 lib32-clang10 lib32-compiler-rt10 lib32-clang-analyzer10 lib32-clang-tools-extra10)

  DESTDIR="$pkgdir" ninja $NINJAFLAGS -C ${srcdir}/llvm-project-llvmorg-${pkgver}/llvm/build install
  DESTDIR="$pkgdir" ninja $NINJAFLAGS -C ${srcdir}/llvm-project-llvmorg-${pkgver}/llvm/build install-distribution

  # The runtime library goes into lib32-llvm-libs
  mv "$pkgdir"/opt/llvm10/lib32/lib{LLVM,LTO,Remarks}*.so* "$srcdir"
  mv -f "$pkgdir"/opt/llvm10/lib32/LLVMgold.so "$srcdir"

  # Fix permissions of static libs
  chmod -x "$pkgdir"/opt/llvm10/lib32/*.a

  mv "$pkgdir/opt/llvm10/bin/llvm-config" "$pkgdir/opt/llvm10/lib32/llvm-config"
  mv "$pkgdir/opt/llvm10/include/llvm/Config/llvm-config.h" "$pkgdir/opt/llvm10/lib32/llvm-config-32.h"

  rm -rf "$pkgdir"/opt/llvm10/{bin,include,lib,libexec,share}

  # Needed for multilib (https://bugs.archlinux.org/task/29951)
  # Header stub is taken from Fedora
  install -d "$pkgdir/opt/llvm10/include/llvm/Config"
  mv "$pkgdir/opt/llvm10/lib32/llvm-config-32.h" "$pkgdir/opt/llvm10/include/llvm/Config/"

  mkdir "$pkgdir"/opt/llvm10/bin
  mv "$pkgdir/opt/llvm10/lib32/llvm-config" "$pkgdir/opt/llvm10/bin/llvm-config32"

  # link to /opt/llvm10/lib32
  install -d "$pkgdir/usr/lib32"
  ln -s /opt/llvm10/lib32/libclang.so.10 "$pkgdir"/usr/lib32/libclang.so.10
  ln -s /opt/llvm10/lib32/libclang-cpp.so.10 "$pkgdir"/usr/lib32/libclang-cpp.so.10

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

package_lib32-llvm10-libs-minimal(){
  pkgdesc='Low Level Virtual Machine (runtime library) (32-bit)'
  depends=(lib32-libffi lib32-zlib lib32-zstd lib32-ncurses lib32-libxml2 lib32-gcc-libs)
  provides=(lib32-llvm10-libs)

  install -d "$pkgdir/opt/llvm10/lib32"

  cp -P \
    "$srcdir"/lib{LLVM,LTO,Remarks}*.so* \
    "$srcdir"/LLVMgold.so \
    "$pkgdir/opt/llvm10/lib32/"

  # Symlink LLVMgold.so from /usr/lib/bfd-plugins
  # https://bugs.archlinux.org/task/28479
  install -d "$pkgdir/opt/llvm10/lib32/bfd-plugins"
  ln -s ../LLVMgold.so "$pkgdir/opt/llvm10/lib32/bfd-plugins/LLVMgold.so"

  # link to /opt/llvm10/lib32
  install -d "$pkgdir/usr/lib32"
  ln -s /opt/llvm10/lib32/libLLVM-10.0.0.so "$pkgdir"/usr/lib32/libLLVM-10.0.0.so
  ln -s /opt/llvm10/lib32/libLLVM-10.so "$pkgdir"/usr/lib32/libLLVM-10.so
  ln -s /opt/llvm10/lib32/libLTO.so.10 "$pkgdir"/usr/lib32/libLTO.so.10
  ln -s /opt/llvm10/lib32/libRemarks.so.10 "$pkgdir"/usr/lib32/libRemarks.so.10

  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/CREDITS.TXT" "$pkgdir/usr/share/licenses/$pkgname/CREDITS"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/CODE_OWNERS.TXT" "$pkgdir/usr/share/licenses/$pkgname/CODE_OWNERS"
}

sha256sums=('b81c96d2f8f40dc61b14a167513d87c0d813aae0251e06e11ae8a4384ca15451'
            '9e557a18f3ca96cc5cc9b62d2e308b993025523b2aca0735248118a928c8c3ff')
