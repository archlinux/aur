#_     _            _                                _____
#| |__ | | __ _  ___| | ___ __ ___   ___   ___  _ __ |___ /
#| '_ \| |/ _` |/ __| |/ / '_ ` _ \ / _ \ / _ \| '_ \  |_ \
#| |_) | | (_| | (__|   <| | | | | | (_) | (_) | | | |___) |
#|_.__/|_|\__,_|\___|_|\_\_| |_| |_|\___/ \___/|_| |_|____/

#Maintainer: blackmoon3 <https://github.com/blacksky3>
#Credits: Evangelos Foutras <evangelos@foutrelis.com>
#Credits: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgbase=llvm12-minimal
pkgname=(llvm12-minimal llvm12-libs-minimal)
url='https://llvm.org/'
pkgver=12.0.0
pkgrel=1
_pkgver=12.0.0
arch=(x86_64)
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=(cmake ninja zlib zstd libffi libedit ncurses libxml2 python-setuptools python-psutil python-sphinx python-recommonmark
             git patch)
options=(staticlibs !lto) # Getting thousands of test failures with LTO
source=(https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-${pkgver}.tar.gz
        https://github.com/KhronosGroup/SPIRV-LLVM-Translator/archive/refs/tags/v${pkgver}.tar.gz
        llvm-config.h
        force-visibility-of-llvm-Any-to-external.patch
        llvm-link-with-Bsymbolic-functions.patch
        add-fno-semantic-interposition.patch
        x86-twist-shuffle-mask.patch
        no-strict-aliasing-DwarfCompileUnit.patch
        partially-revert-scan-view-remove-Reporter.py.patch
        opencl-respect-calling-convention-for-builtin.patch
        clangd-CompletionModel-cmake.patch
        clang-link-with-Bsymbolic-functions.patch
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
  # https://bugs.llvm.org/show_bug.cgi?id=48992
  patch -Np2 -i ${srcdir}/force-visibility-of-llvm-Any-to-external.patch
  # https://bugs.archlinux.org/task/70697
  patch -Np2 -i ${srcdir}/llvm-link-with-Bsymbolic-functions.patch
  # https://reviews.llvm.org/D102453
  patch -Np2 -i ${srcdir}/add-fno-semantic-interposition.patch
  # https://bugs.llvm.org/show_bug.cgi?id=50823
  patch -Np2 -i ${srcdir}/x86-twist-shuffle-mask.patch
  # Work around intermittent 'clang -O -g' crashes
  # https://bugs.llvm.org/show_bug.cgi?id=50611#c3
  patch -Np2 -i ${srcdir}/no-strict-aliasing-DwarfCompileUnit.patch

  cd ${srcdir}/llvm-project-llvmorg-${pkgver}/clang
  patch -Np2 -i ${srcdir}/enable-SSP-and-PIE-by-default.patch
  # Some fixes from the release/12.x branch
  patch -Np2 -i ${srcdir}/partially-revert-scan-view-remove-Reporter.py.patch
  patch -Np2 -i ${srcdir}/opencl-respect-calling-convention-for-builtin.patch
  # https://bugs.archlinux.org/task/70697
  patch -Np2 -i ${srcdir}/clang-link-with-Bsymbolic-functions.patch

  cd ${srcdir}/llvm-project-llvmorg-${pkgver}/clang-tools-extra
  # https://bugs.llvm.org/show_bug.cgi?id=49990
  patch -Np2 -i ${srcdir}/clangd-CompletionModel-cmake.patch

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
    -DCMAKE_INSTALL_PREFIX=/opt/llvm12
    -DLLVM_BINUTILS_INCDIR=/opt/llvm12/include
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
    -DCOMPILER_RT_INSTALL_PATH=/opt/llvm12/lib/clang/$_pkgver
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

package_llvm12-minimal(){
  pkgdesc='Collection of modular and reusable compiler and toolchain technologies'
  depends=(llvm12-libs-minimal perl)
  #depends+=(spirv-tools-git) # For spirv-llvm-translator
  optdepends=('python: for using lit (LLVM Integrated Tester)'
              'python-setuptools: for using lit')
  provides=(llvm12 clang12 compiler-rt12 spirv-llvm-translator12 clang-analyzer12 clang-tools-extra12)

  cd ${srcdir}/llvm-project-llvmorg-${pkgver}/llvm/build

  DESTDIR="$pkgdir" ninja $NINJAFLAGS install
  DESTDIR="$pkgdir" ninja $NINJAFLAGS install-distribution

  # Include lit for running lit-based tests in other projects
  #pushd ../utils/lit
  #python3 setup.py install --root="$pkgdir" -O1
  #popd

  # The runtime libraries go into llvm-libs
  mv -f "$pkgdir"/opt/llvm12/lib/lib{LLVM,LTO,Remarks}*.so* "$srcdir"
  mv -f "$pkgdir"/opt/llvm12/lib/LLVMgold.so "$srcdir"

  if [[ $CARCH == x86_64 ]]; then
    # Needed for multilib (https://bugs.archlinux.org/task/29951)
    # Header stub is taken from Fedora
    mv "$pkgdir/opt/llvm12/include/llvm/Config/llvm-config"{,-64}.h
    cp "$srcdir/llvm-config.h" "$pkgdir/opt/llvm12/include/llvm/Config/llvm-config.h"
  fi

  # Move scanbuild-py into site-packages and install Python bindings
  local site_packages="/opt/llvm12/lib/python3.10/site-packages"
  install -d "$pkgdir/$site_packages"
  #mv "$pkgdir"/opt/llvm12/lib/{libear,libscanbuild} "$pkgdir/$site_packages/"
  cp -a ${srcdir}/llvm-project-llvmorg-${pkgver}/clang/bindings/python/clang "$pkgdir/$site_packages/"
  # (taken from llvm-git aur)
  cp -a ${srcdir}/llvm-project-llvmorg-${pkgver}/llvm/bindings/python/llvm "$pkgdir/$site_packages/"

  # Move analyzer scripts out of /usr/libexec
  mv "$pkgdir"/opt/llvm12/libexec/* "$pkgdir/opt/llvm12/lib/clang/"
  rmdir "$pkgdir/opt/llvm12/libexec"
  sed -i 's|libexec|lib/clang|' \
    "$pkgdir/opt/llvm12/bin/scan-build"
    #"$pkgdir/$site_packages/libscanbuild/analyze.py"

  # Compile Python scripts
  #_python_optimize "$pkgdir/opt/llvm12/share" "$pkgdir/$site_packages"

  # link to /opt/llvm12/lib
  install -d "$pkgdir/usr/lib"
  ln -s /opt/llvm12/lib/libclang.so.12 "$pkgdir"/usr/lib/libclang.so.12
  ln -s /opt/llvm12/lib/libclang-cpp.so.12 "$pkgdir"/usr/lib/libclang-cpp.so.12

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

package_llvm12-libs-minimal(){
  pkgdesc='LLVM runtime libraries'
  depends=(gcc-libs zlib zstd libffi libedit ncurses libxml2)
  provides=(llvm12-libs)

  install -d "$pkgdir/opt/llvm12/lib"
  cp -P \
    "$srcdir"/lib{LLVM,LTO,Remarks}*.so* \
    "$srcdir"/LLVMgold.so \
    "$pkgdir/opt/llvm12/lib/"

  # Symlink LLVMgold.so from /usr/lib/bfd-plugins
  # https://bugs.archlinux.org/task/28479
  install -d "$pkgdir/opt/llvm12/lib/bfd-plugins"
  ln -s ../LLVMgold.so "$pkgdir/opt/llvm12/lib/bfd-plugins/LLVMgold.so"

  # link to /opt/llvm12/lib
  install -d "$pkgdir/usr/lib"
  ln -s /opt/llvm12/lib/libLLVM-12.0.0.so "$pkgdir"/usr/lib/libLLVM-12.0.0.so
  ln -s /opt/llvm12/lib/libLLVM-12.so "$pkgdir"/usr/lib/libLLVM-12.so
  ln -s /opt/llvm12/lib/libLTO.so.12 "$pkgdir"/usr/lib/libLTO.so.12
  ln -s /opt/llvm12/lib/libRemarks.so.12 "$pkgdir"/usr/lib/libRemarks.so.12

  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/CREDITS.TXT" "$pkgdir/usr/share/licenses/$pkgname/CREDITS"
  install -Dm644 "$srcdir/llvm-project-llvmorg-${pkgver}/llvm/CODE_OWNERS.TXT" "$pkgdir/usr/share/licenses/$pkgname/CODE_OWNERS"
}

sha256sums=('8e6c99e482bb16a450165176c2d881804976a2d770e0445af4375e78a1fbf19c'
            '6e4fad04203f25fcde4c308c53e9f59bd05a390978992db3212d4b63aff62108'
            '597dc5968c695bbdbb0eac9e8eb5117fcd2773bc91edf5ec103ecffffab8bc48'
            '98721af5a36af2a8e88c14a81b16d3929b12515d7d2d1ba385eb243dca3c32cb'
            '560ce1e206c19f4b86f4c583b743db0ad47a610418999350710aafd60ae50fcd'
            'fc8c64267a5d179e9fc24fb2bc6150edef2598c83f5b2d138d14e05ce9f4e345'
            'c51b8754f76eb3774f46d530409f6d89f5bb47d90f0d718dbfa861f716b29693'
            'd1eff24508e35aae6c26a943dbaa3ef5acb60a145b008fd1ef9ac6f6c4faa662'
            '68be2fb78e62f76702a156d4c1759b4c6f0d805e1b492e9c6f490ce40862138d'
            '859d34dac43999edfc4c33e1cbb6e7458921fa9f16a93514701c1a9706665d24'
            '6739abedc8870879618414c5358fda4fcfd4a3ac7a22030ac7c409779b68f669'
            '5bc0b47c70990bb8dd0cf4138a8ab9e15cf6b008b7c0cf2c7aac3736b559e0e6'
            'a877fa5cf1c1cca3bd55f9a36cf8c1bdd061ff398aeace90fe3cbd9e82550da3')
