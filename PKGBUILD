#_     _            _                                _____
#| |__ | | __ _  ___| | ___ __ ___   ___   ___  _ __ |___ /
#| '_ \| |/ _` |/ __| |/ / '_ ` _ \ / _ \ / _ \| '_ \  |_ \
#| |_) | | (_| | (__|   <| | | | | | (_) | (_) | | | |___) |
#|_.__/|_|\__,_|\___|_|\_\_| |_| |_|\___/ \___/|_| |_|____/

#Maintainer: blackmoon3 <https://github.com/blacksky3>
#Credits: Evangelos Foutras <evangelos@foutrelis.com>
#Credits: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgbase=llvm10-minimal
pkgname=(llvm10-minimal clang10-minimal llvm10-libs-minimal clang10-libs-minimal)
url='https://llvm.org/'
pkgver=10.0.0
pkgrel=1
_pkgver=10.0.0
arch=(x86_64)
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=(cmake ninja zlib zstd libffi libedit ncurses
             libxml2 python-setuptools python-psutil python-sphinx
             python-recommonmark gcc12 gcc12-fortran gcc12-libs)
options=(staticlibs !lto) # Getting thousands of test failures with LTO
source=(https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-${pkgver}.tar.gz
        https://github.com/KhronosGroup/SPIRV-LLVM-Translator/archive/refs/tags/v${pkgver}.tar.gz
        llvm-config.h
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
export CC=/usr/bin/gcc-12
export CXX=/usr/bin/g++-12
export CFLAGS+=" ${CPPFLAGS}"
export CXXFLAGS+=" ${CPPFLAGS}"

  cd ${srcdir}/llvm-project-llvmorg-${pkgver}/llvm

  rm -rf build

  mkdir build

  cd build

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/opt/llvm10
    -DLLVM_BINUTILS_INCDIR=/opt/llvm10/include
    -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi)
    -DLLVM_VERSION_SUFFIX=""
    -DLLVM_APPEND_VC_REV=ON
    -DLLVM_HOST_TRIPLE=$CHOST
    -DLLVM_TARGETS_TO_BUILD="AMDGPU;X86"
    -DLLVM_BUILD_LLVM_DYLIB=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DCLANG_LINK_CLANG_DYLIB=ON
    -DLLVM_DYLIB_COMPONENTS="all"
    -DLLVM_INSTALL_UTILS=ON
    -DLLVM_ENABLE_RTTI=ON
    -DLLVM_ENABLE_FFI=ON
    -DLLVM_USE_PERF=ON
    -DLLVM_INCLUDE_BENCHMARKS=OFF
    -DLLVM_INCLUDE_EXAMPLES=OFF
    -DLLVM_BUILD_DOCS=OFF
    -DLLVM_INCLUDE_DOCS=OFF
    -DLLVM_ENABLE_OCAMLDOC=OFF
    -DLLVM_ENABLE_SPHINX=OFF
    -DLLVM_ENABLE_DOXYGEN=OFF
    -DLLVM_ENABLE_BINDINGS=OFF
    -DLLVM_ENABLE_PROJECTS="compiler-rt;clang-tools-extra;clang"
    -DCOMPILER_RT_INSTALL_PATH=/opt/llvm10/lib/clang/$_pkgver
    -DLLVM_ENABLE_DUMP=ON
    #-DLLVM_EXTERNAL_PROJECTS="SPIRV-LLVM-Translator"
    #-DLLVM_EXTERNAL_SPIRV_LLVM_TRANSLATOR_SOURCE_DIR="$srcdir"/SPIRV-LLVM-Translator-${pkgver}
    #-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=/usr/include/spirv/
    #-DLLVM_SPIRV_INCLUDE_TESTS=OFF
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

_python_optimize(){
  python -m compileall "$@"
  python -O -m compileall "$@"
  python -OO -m compileall "$@"
}

package_llvm10-minimal(){
  pkgdesc='Collection of modular and reusable compiler and toolchain technologies'
  depends=(llvm10-libs-minimal perl)
  optdepends=('python: for using lit (LLVM Integrated Tester)'
              'python-setuptools: for using lit')
  provides=(llvm10)

  cd ${srcdir}/llvm-project-llvmorg-${pkgver}/llvm/build

  DESTDIR="$pkgdir" ninja $NINJAFLAGS install
  DESTDIR="$pkgdir" ninja $NINJAFLAGS install-distribution

  # Include lit for running lit-based tests in other projects
  #pushd ../utils/lit
  #python3 setup.py install --root="$pkgdir" -O1
  #popd

  # The runtime libraries go into llvm-libs
  mv -f "$pkgdir"/opt/llvm10/lib/lib{LLVM,LTO,Remarks}*.so* "$srcdir"
  mv -f "$pkgdir"/opt/llvm10/lib/LLVMgold.so "$srcdir"

  # The clang runtime libraries go into clang-libs-minimal-git
  # https://bugs.archlinux.org/task/72588?project=1&string=clang
  mv -f "$pkgdir"/opt/llvm10/lib/libclang{,-cpp}.so* "$srcdir"

  # clang-minimal-git files go to a separate package
  mkdir -p "$srcdir"/clang/opt/llvm10/{bin,include,lib,lib/cmake,share}
  #mv -f "$pkgdir"/opt/llvm10/lib/{libear,libscanbuild,libclang*.a,clang} "$srcdir"/clang/opt/llvm10/lib
  mv -f "$pkgdir"/opt/llvm10/lib/{libclang*.a,clang} "$srcdir"/clang/opt/llvm10/lib
  mv -f "$pkgdir"/opt/llvm10/lib/cmake/clang "$srcdir"/clang/opt/llvm10/lib/cmake/
  #mv -f "$pkgdir"/opt/llvm10/include/{clang,clang-tidy,clang-c} "$srcdir"/clang/opt/llvm10/include/
  mv -f "$pkgdir"/opt/llvm10/include/{clang,clang-c} "$srcdir"/clang/opt/llvm10/include/
  mv -f "$pkgdir"/opt/llvm10/libexec "$srcdir"/clang/opt/llvm10/
  #mv -f "$pkgdir"/opt/llvm10/bin/{analyze-build,c-index-test,clang*,diagtool,find-all-symbols,git-clang-format,hmaptool,intercept-build,modularize,pp-trace,run-clang-tidy,scan-build,scan-build-py,scan-view} "$srcdir"/clang/opt/llvm10/bin/
  mv -f "$pkgdir"/opt/llvm10/bin/{c-index-test,clang*,diagtool,find-all-symbols,git-clang-format,hmaptool,modularize,pp-trace,scan-build,scan-view} "$srcdir"/clang/opt/llvm10/bin/
  mv -f "$pkgdir"/opt/llvm10/share/{clang,man,opt-viewer,scan-build,scan-view} "$srcdir"/clang/opt/llvm10/share/

  if [[ $CARCH == x86_64 ]]; then
    # Needed for multilib (https://bugs.archlinux.org/task/29951)
    # Header stub is taken from Fedora
    mv "$pkgdir/opt/llvm10/include/llvm/Config/llvm-config"{,-64}.h
    cp "$srcdir/llvm-config.h" "$pkgdir/opt/llvm10/include/llvm/Config/llvm-config.h"
  fi

  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/llvm/LICENSE"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/CREDITS.TXT" "$pkgdir/usr/share/licenses/$pkgname/llvm/CREDITS"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/CODE_OWNERS.TXT" "$pkgdir/usr/share/licenses/$pkgname/llvm/CODE_OWNERS"
}

package_clang10-minimal(){
  pkgdesc='C language family frontend for LLVM'
  depends=(llvm10-libs-minimal clang10-libs-minimal gcc12)
  optdepends=('openmp: OpenMP support in clang with -fopenmp'
              'python: for scan-view, scan-build, git-clang-format, clang-rename and python bindings'
              'llvm10-minimal: referenced by some clang headers')
  provides=(clang10 compiler-rt10 clang-analyzer10 clang-tools-extra10)

  cp --preserve --recursive "$srcdir"/clang/* "$pkgdir"/

  # I think it's usefull to have this CLANG Python bindings since we ship complete CLANG
  # If I proove that it's not usefull we will remove the below
  # Move scanbuild-py into site-packages and install Python bindings
  _py=$([[ "$(python -V)" =~ Python[[:space:]]*([0-9]+.[0-9]+) ]] && echo ${BASH_REMATCH[1]})
  local site_packages="/opt/llvm10/lib/python$_py/site-packages"
  install -d "$pkgdir/$site_packages"
  #mv "$pkgdir"/opt/llvm10/lib/{libear,libscanbuild} "$pkgdir/$site_packages/"
  cp -a ${srcdir}/llvm-project-llvmorg-${pkgver}/clang/bindings/python/clang "$pkgdir/$site_packages/"

  # Move analyzer scripts out of /usr/libexec
  mv "$pkgdir"/opt/llvm10/libexec/* "$pkgdir/opt/llvm10/lib/clang/"
  rmdir "$pkgdir/opt/llvm10/libexec"
  sed -i 's|libexec|lib/clang|' \
    "$pkgdir/opt/llvm10/bin/scan-build"
    #"$pkgdir/$site_packages/libscanbuild/analyze.py"

  # Compile Python scripts
  _python_optimize "$pkgdir/opt/llvm10/share" "$pkgdir/$site_packages"

  # (taken from llvm-git aur)
  # optimize other python files except 2 problem cases
  _python_optimize "$pkgdir"/opt/llvm10/share -x 'clang-include-fixer|run-find-all-symbols'

  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/clang/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/clang/LICENSE"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/clang/CODE_OWNERS.TXT" "$pkgdir/usr/share/licenses/$pkgname/clang/CODE_OWNERS"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/clang-tools-extra/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/clang-tools-extra/LICENSE"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/clang-tools-extra/CODE_OWNERS.TXT" "$pkgdir/usr/share/licenses/$pkgname/clang-tools-extra/CODE_OWNERS"
  install -Dm644 "${srcdir}/llvm-project-llvmorg-${pkgver}/compiler-rt/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/compiler-rt/LICENSE"
  install -Dm644 "${srcdir}/llvm-project-llvmorg-${pkgver}/compiler-rt/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/compiler-rt/LICENSE"
}

package_llvm10-libs-minimal(){
  pkgdesc='LLVM runtime libraries'
  depends=(gcc12-libs zlib zstd libffi libedit ncurses libxml2)
  provides=(llvm10-libs)

  install -d "$pkgdir/opt/llvm10/lib"
  cp -P \
    "$srcdir"/lib{LLVM,LTO,Remarks}*.so* \
    "$srcdir"/LLVMgold.so \
    "$pkgdir/opt/llvm10/lib/"

  # Symlink LLVMgold.so from /usr/lib/bfd-plugins
  # https://bugs.archlinux.org/task/28479
  install -d "$pkgdir/opt/llvm10/lib/bfd-plugins"
  ln -s ../LLVMgold.so "$pkgdir/opt/llvm10/lib/bfd-plugins/LLVMgold.so"

  # link to /opt/llvm10/lib
  install -d "$pkgdir/usr/lib"
  ln -s /opt/llvm10/lib/libLLVM-10.0.0.so "$pkgdir"/usr/lib/libLLVM-10.0.0.so
  ln -s /opt/llvm10/lib/libLLVM-10.so "$pkgdir"/usr/lib/libLLVM-10.so
  ln -s /opt/llvm10/lib/libLTO.so.10 "$pkgdir"/usr/lib/libLTO.so.10
  ln -s /opt/llvm10/lib/libRemarks.so.10 "$pkgdir"/usr/lib/libRemarks.so.10

  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/CREDITS.TXT" "$pkgdir/usr/share/licenses/$pkgname/CREDITS"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/CODE_OWNERS.TXT" "$pkgdir/usr/share/licenses/$pkgname/CODE_OWNERS"
}

# https://bugs.archlinux.org/task/72588?project=1&string=clang
package_clang10-libs-minimal(){
  pkgdesc='Clang runtime libraries'
  depends=(llvm10-libs-minimal)
  # clang-libs doesn't exist in repos at this time, but it's cleaner to provide & conflict it.
  # TODO: Once repo clang-libs comes into existence, verify if changes are needed to this package
  provides=(clang10-libs)

  install -d "$pkgdir/opt/llvm10/lib"
  cp -P \
    "$srcdir"/lib{clang,clang-cpp}.so* \
    "$pkgdir/opt/llvm10/lib/"

  # link to /opt/llvm10/lib
  install -d "$pkgdir/usr/lib"
  ln -s /opt/llvm10/lib/libclang.so.10 "$pkgdir"/usr/lib/libclang.so.10
  ln -s /opt/llvm10/lib/libclang-cpp.so.10 "$pkgdir"/usr/lib/libclang-cpp.so.10

  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/clang/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/clang/LICENSE"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/clang/CODE_OWNERS.TXT" "$pkgdir/usr/share/licenses/$pkgname/clang/CODE_OWNERS"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/clang-tools-extra/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/clang-tools-extra/LICENSE"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/clang-tools-extra/CODE_OWNERS.TXT" "$pkgdir/usr/share/licenses/$pkgname/clang-tools-extra/CODE_OWNERS"
}

sha256sums=('b81c96d2f8f40dc61b14a167513d87c0d813aae0251e06e11ae8a4384ca15451'
            '7ccde52bac4c9ad967a362a3c5ec7261aa5b7b34d28cef0f3dec38d77c923049'
            '597dc5968c695bbdbb0eac9e8eb5117fcd2773bc91edf5ec103ecffffab8bc48'
            '9e557a18f3ca96cc5cc9b62d2e308b993025523b2aca0735248118a928c8c3ff')

# vim:set ts=8 sts=2 sw=2 et:
