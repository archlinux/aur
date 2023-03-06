#_     _            _                                _____
#| |__ | | __ _  ___| | ___ __ ___   ___   ___  _ __ |___ /
#| '_ \| |/ _` |/ __| |/ / '_ ` _ \ / _ \ / _ \| '_ \  |_ \
#| |_) | | (_| | (__|   <| | | | | | (_) | (_) | | | |___) |
#|_.__/|_|\__,_|\___|_|\_\_| |_| |_|\___/ \___/|_| |_|____/

#Maintainer: blackmoon3 <https://github.com/blacksky3>
#Credits: Evangelos Foutras <evangelos@foutrelis.com>
#Credits: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgbase=llvm13-minimal
pkgname=(llvm13-minimal llvm13-libs-minimal)
url='https://llvm.org/'
pkgver=13.0.0
pkgrel=1
_pkgver=13.0.0
arch=(x86_64)
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=(cmake ninja zlib zstd libffi libedit ncurses libxml2 python-setuptools python-psutil python-sphinx python-recommonmark
             git patch)
options=(staticlibs !lto) # Getting thousands of test failures with LTO
source=(https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-${pkgver}.tar.gz
        https://github.com/KhronosGroup/SPIRV-LLVM-Translator/archive/refs/tags/v${pkgver}.tar.gz
        llvm-config.h
        don-t-accept-nullptr-as-GEP-element-type.patch
        don-t-override-__attribute__-no_stack_protector.patch
        don-t-move-DBG_VALUE-instructions.patch
        disable-A-B-A-B-and-BSWAP-in-InstCombine.patch
        disable-DIArgList-in-SPIR-V.patch
        strip-exception-specifications-in-CFI-type-names.patch
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
  cd ${srcdir}/llvm-project-llvmorg-${pkgver}/llvm
  # https://github.com/intel/intel-graphics-compiler/issues/204
  patch -Rp2 -i ${srcdir}/don-t-accept-nullptr-as-GEP-element-type.patch
  # Fixes Chromium error "*** stack smashing detected ***: terminated"
  # (which also goes away with "--change-stack-guard-on-fork=disabled")
  # https://reviews.llvm.org/D116589
  patch -Np2 -i ${srcdir}/don-t-override-__attribute__-no_stack_protector.patch
  # https://github.com/llvm/llvm-project/issues/53243
  # https://github.com/rust-lang/rust/issues/92869
  patch -Np2 -i ${srcdir}/don-t-move-DBG_VALUE-instructions.patch
  # Patches needed for ISPC for Xe only
  patch -Np2 -i ${srcdir}/disable-A-B-A-B-and-BSWAP-in-InstCombine.patch
  patch -Np2 -i ${srcdir}/disable-DIArgList-in-SPIR-V.patch

  cd ${srcdir}/llvm-project-llvmorg-${pkgver}/clang
  patch -Np2 -i ${srcdir}/enable-SSP-and-PIE-by-default.patch
  patch -Np2 -i ${srcdir}/strip-exception-specifications-in-CFI-type-names.patch

  # Attempt to convert script to Python 3
  2to3 -wn --no-diffs \
      ${srcdir}/llvm-project-llvmorg-${pkgver}/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-all-symbols.py
}

build(){
export CFLAGS+=" ${CPPFLAGS}"
export CXXFLAGS+=" ${CPPFLAGS}"

  cd ${srcdir}/llvm-project-llvmorg-${pkgver}/llvm

  rm -rf build

  mkdir build

  cd build

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/opt/llvm13
    -DLLVM_BINUTILS_INCDIR=/opt/llvm13/include
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
    -DCOMPILER_RT_INSTALL_PATH=/opt/llvm13/lib/clang/$_pkgver
    -DLLVM_ENABLE_DUMP=ON
    -DLLVM_EXTERNAL_PROJECTS="SPIRV-LLVM-Translator"
    -DLLVM_EXTERNAL_SPIRV_LLVM_TRANSLATOR_SOURCE_DIR="$srcdir"/SPIRV-LLVM-Translator-${pkgver}
    #-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=/usr/include/spirv/
    -DLLVM_SPIRV_INCLUDE_TESTS=OFF
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

package_llvm13-minimal(){
  pkgdesc='Collection of modular and reusable compiler and toolchain technologies'
  depends=(llvm13-libs-minimal perl)
  #depends+=(spirv-tools-git) # For spirv-llvm-translator
  optdepends=('python: for using lit (LLVM Integrated Tester)'
              'python-setuptools: for using lit')
  provides=(llvm13 clang13 compiler-rt13 spirv-llvm-translator13 clang-analyzer13 clang-tools-extra13)

  cd ${srcdir}/llvm-project-llvmorg-${pkgver}/llvm/build

  DESTDIR="$pkgdir" ninja $NINJAFLAGS install
  DESTDIR="$pkgdir" ninja $NINJAFLAGS install-distribution

  # Include lit for running lit-based tests in other projects
  #pushd ../utils/lit
  #python3 setup.py install --root="$pkgdir" -O1
  #popd

  # The runtime libraries go into llvm-libs
  mv -f "$pkgdir"/opt/llvm13/lib/lib{LLVM,LTO,Remarks}*.so* "$srcdir"
  mv -f "$pkgdir"/opt/llvm13/lib/LLVMgold.so "$srcdir"

  if [[ $CARCH == x86_64 ]]; then
    # Needed for multilib (https://bugs.archlinux.org/task/29951)
    # Header stub is taken from Fedora
    mv "$pkgdir/opt/llvm13/include/llvm/Config/llvm-config"{,-64}.h
    cp "$srcdir/llvm-config.h" "$pkgdir/opt/llvm13/include/llvm/Config/llvm-config.h"
  fi

  # Move scanbuild-py into site-packages and install Python bindings
  local site_packages="/opt/llvm13/lib/python3.10/site-packages"
  install -d "$pkgdir/$site_packages"
  mv "$pkgdir"/opt/llvm13/lib/{libear,libscanbuild} "$pkgdir/$site_packages/"
  cp -a ${srcdir}/llvm-project-llvmorg-${pkgver}/clang/bindings/python/clang "$pkgdir/$site_packages/"
  # (taken from llvm-git aur)
  cp -a ${srcdir}/llvm-project-llvmorg-${pkgver}/llvm/bindings/python/llvm "$pkgdir/$site_packages/"

  # Move analyzer scripts out of /usr/libexec
  mv "$pkgdir"/opt/llvm13/libexec/* "$pkgdir/opt/llvm13/lib/clang/"
  rmdir "$pkgdir/opt/llvm13/libexec"
  sed -i 's|libexec|lib/clang|' \
    "$pkgdir/opt/llvm13/bin/scan-build" \
    "$pkgdir/$site_packages/libscanbuild/analyze.py"

  # Compile Python scripts
  #_python_optimize "$pkgdir/opt/llvm13/share" "$pkgdir/$site_packages"

  # link to /opt/llvm13/lib
  install -d "$pkgdir/usr/lib"
  ln -s /opt/llvm13/lib/libclang.so.13 "$pkgdir"/usr/lib/libclang.so.13
  ln -s /opt/llvm13/lib/libclang-cpp.so.13 "$pkgdir"/usr/lib/libclang-cpp.so.13

  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/llvm/LICENSE"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/CREDITS.TXT" "$pkgdir/usr/share/licenses/$pkgname/llvm/CREDITS"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/CODE_OWNERS.TXT" "$pkgdir/usr/share/licenses/$pkgname/llvm/CODE_OWNERS"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/clang/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/clang/LICENSE"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/clang/CODE_OWNERS.TXT" "$pkgdir/usr/share/licenses/$pkgname/clang/CODE_OWNERS"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/clang-tools-extra/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/clang-tools-extra/LICENSE"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/clang-tools-extra/CODE_OWNERS.TXT" "$pkgdir/usr/share/licenses/$pkgname/clang-tools-extra/CODE_OWNERS"
  install -Dm644 "${srcdir}/llvm-project-llvmorg-${pkgver}/compiler-rt/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/compiler-rt/LICENSE"
  install -Dm644 "${srcdir}/llvm-project-llvmorg-${pkgver}/compiler-rt/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/compiler-rt/LICENSE"
  install -Dm644 "${srcdir}/SPIRV-LLVM-Translator-${pkgver}/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/spirv-llvm-translator/LICENSE"
}

package_llvm13-libs-minimal(){
  pkgdesc='LLVM runtime libraries'
  depends=(gcc-libs zlib zstd libffi libedit ncurses libxml2)
  provides=(llvm13-libs)

  install -d "$pkgdir/opt/llvm13/lib"
  cp -P \
    "$srcdir"/lib{LLVM,LTO,Remarks}*.so* \
    "$srcdir"/LLVMgold.so \
    "$pkgdir/opt/llvm13/lib/"

  # Symlink LLVMgold.so from /usr/lib/bfd-plugins
  # https://bugs.archlinux.org/task/28479
  install -d "$pkgdir/opt/llvm13/lib/bfd-plugins"
  ln -s ../LLVMgold.so "$pkgdir/opt/llvm13/lib/bfd-plugins/LLVMgold.so"

  # link to /opt/llvm13/lib
  install -d "$pkgdir/usr/lib"
  ln -s /opt/llvm13/lib/libLLVM-13.0.0.so "$pkgdir"/usr/lib/libLLVM-13.0.0.so
  ln -s /opt/llvm13/lib/libLLVM-13.so "$pkgdir"/usr/lib/libLLVM-13.so
  ln -s /opt/llvm13/lib/libLTO.so.13 "$pkgdir"/usr/lib/libLTO.so.13
  ln -s /opt/llvm13/lib/libRemarks.so.13 "$pkgdir"/usr/lib/libRemarks.so.13

  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/CREDITS.TXT" "$pkgdir/usr/share/licenses/$pkgname/CREDITS"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/CODE_OWNERS.TXT" "$pkgdir/usr/share/licenses/$pkgname/CODE_OWNERS"
}

sha256sums=('a1131358f1f9f819df73fa6bff505f2c49d176e9eef0a3aedd1fdbce3b4630e8'
            'b416c06525c8724be628327565956c418755fbb471b4fe23d040ca56e1a79061'
            '597dc5968c695bbdbb0eac9e8eb5117fcd2773bc91edf5ec103ecffffab8bc48'
            'a7e902a7612d0fdabe436a917468b043cc296bc89d8954bfc3126f737beb9ac4'
            '9f0a4578b94eb8853b83af2f65e92705254b4b56d96f9a941714d174b932f465'
            'f7d69f84241416398fdb3df8bb44f9fae3c49d89889c7ffa3b37aa2e9d78f708'
            '34cc0d79a30599cb2287b47b4e9a1a5bf03d57a1f8bb35be3fe976ffc4a604f6'
            '8642da2d556092e4284873ba6ddc6c9a67841f42cc16f923bcd523e4b304a3ff'
            '3f4a2784a4c2b2df13e03beb0b66d5805c520f2b9f16ff76e0557daeb284c8fa'
            '67706047fc93a2e79185d344bdac48219ce042c55ddb9b9397bc98db2153ba58')
