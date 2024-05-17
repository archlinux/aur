# Maintainer: Romain Malmain <romain.malmain@pm.me>
# Contributor: Daniele Basso
# Contributor: Lancelot Owczarczak <lancelot@owczarczak.fr>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

# LLVM Version
_pkgver_major=18
_pkgver_minor=1
_pkgver_patch=5

# Whether we intend to build the generic llvm package or not
# Switching betwwen specialized and generic llvm package also requires to change
# package functions' name
_build_main_package=false

pkgver="$_pkgver_major.$_pkgver_minor.$_pkgver_patch"

# Install directory
if [[ "$_build_main_package" = true ]]; then
  _llvm_install_dir="/usr"
else
  _llvm_install_dir="/usr/lib/llvm$_pkgver_major"
fi

# Sources download link
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver

if [[ "$_build_main_package" = true ]]; then
  pkgname=("llvm" "llvm-libs")
else
  pkgname=("llvm$_pkgver_major" "llvm$_pkgver_major-libs")
fi

pkgrel=1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('cmake' 'ninja' 'zlib' 'zstd' 'libffi' 'libedit' 'ncurses'
             'libxml2' 'python-setuptools' 'python-psutil' 'python-sphinx'
             'python-recommonmark' 'python-myst-parser' 'mold')
options=('staticlibs')
source=($_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig}
        $_source_base/third-party-$pkgver.src.tar.xz{,.sig}
        fix_typeids_test_external_data_section.patch)
b2sums=('2ec08d839e9e07fd90c2b39dd3c16de9023824a6915d7d187c52554e0750959d3d59acd7359ccaaa6cd4f8abcfdc6408ec4c63d993d837f185282072c0d533aa'
        'SKIP'
        '579b87053c38c24f6db5f3a2bc75624f155f2b860a704ba3c382215f79526fed0101e489c5c6ccf2a81654dcc88cd5bff5e5f859201a4ee740e3180221713312'
        'SKIP'
        '459670e6fd6027921dcda386e1a38f1f42e018fce48c0dcf0583e1d0b818fb03780f2e4512253268e2fe78235fb9a1c47c16e47f7015433ba963044a04ee27d2'
        'SKIP'
        '9ed263e76af56a8d749592ebd1538725784a08479f06df436b83762ebf150529e3e4d687ae42e2634961a101e3c9c786d93064a9ed8266392f4cdd4279482608')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042') # Tobias Hieta <tobias@hieta.se>

if [[ "$_build_main_package" = false ]]; then
  makedepends+=('llvm') # llvm is required to get lit
fi

# Utilizing LLVM_DISTRIBUTION_COMPONENTS to avoid
# installing static libraries; inspired by Gentoo
_get_distribution_components() {
  local target
  ninja -t targets | grep -Po 'install-\K.*(?=-stripped:)' | while read -r target; do
    case $target in
      llvm-libraries|distribution)
        continue
        ;;
      # shared libraries
      LLVM|LLVMgold)
        ;;
      # libraries needed for clang-tblgen
      LLVMDemangle|LLVMSupport|LLVMTableGen)
        ;;
      # testing libraries
      LLVMTestingAnnotations|LLVMTestingSupport)
        ;;
      # exclude static libraries
      LLVM*)
        continue
        ;;
      # exclude llvm-exegesis (doesn't seem useful without libpfm)
      llvm-exegesis)
        continue
        ;;
    esac
    echo $target
  done
}

prepare() {
  if [ ! -d cmake ]; then
    rename -v -- "-$pkgver.src" '' cmake-$pkgver.src
  fi

  if [ ! -d third-party ]; then
    rename -v -- "-$pkgver.src" '' third-party-$pkgver.src
  fi

  cd llvm-$pkgver.src
  install -d build

  # Patch failing test when linking with LTO
  patch -N test/tools/llvm-shlib/typeids.test ../fix_typeids_test_external_data_section.patch
}

build() {
  cd llvm-$pkgver.src/build

  # Build only minimal debug info to reduce size
  CFLAGS=${CFLAGS/-g /-g1 }
  CXXFLAGS=${CXXFLAGS/-g /-g1 }

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_DOCDIR=share/doc
    -DCMAKE_INSTALL_PREFIX="$_llvm_install_dir"
    -DCMAKE_SKIP_RPATH=ON
    -DLLVM_BINUTILS_INCDIR=/usr/include
    -DLLVM_BUILD_DOCS=ON
    -DLLVM_BUILD_LLVM_DYLIB=ON
    -DLLVM_BUILD_TESTS=ON
    -DLLVM_ENABLE_BINDINGS=OFF
    -DLLVM_ENABLE_FFI=ON
    -DLLVM_ENABLE_RTTI=ON
    -DLLVM_ENABLE_SPHINX=ON
    -DLLVM_HOST_TRIPLE=$CHOST
    -DLLVM_INCLUDE_BENCHMARKS=OFF
    -DLLVM_INSTALL_GTEST=ON
    -DLLVM_INSTALL_UTILS=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_USE_PERF=ON
    -DLLVM_USE_LINKER=mold
    -DSPHINX_WARNINGS_AS_ERRORS=OFF
  )

  cmake .. "${cmake_args[@]}"
  local distribution_components=$(_get_distribution_components | paste -sd\;)
  test -n "$distribution_components"
  cmake_args+=(-DLLVM_DISTRIBUTION_COMPONENTS="$distribution_components")

  cmake .. "${cmake_args[@]}"
  ninja
}

check() {
  cd llvm-$pkgver.src/build
  LD_LIBRARY_PATH=$PWD/lib ninja check
}

package_llvm18() {
  pkgdesc="Compiler infrastructure (LLVM $_pkgver_major)"
  depends=("llvm$_pkgver_major-libs" "perl")

  cd llvm-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install-distribution

  if [[ "$_build_main_package" = true ]]; then

    # Include lit for running lit-based tests in other projects
    pushd ../utils/lit
    python3 setup.py install --root="$pkgdir" -O1
    popd
  else

    # Create versioned symlinks from /usr/bin/ to /usr/lib/llvm$_pkgver_major/bin/
    install -d "$pkgdir/usr/bin"
    local _binary
    for _binary in "$pkgdir/$_llvm_install_dir"/bin/*; do
      local _basename=${_binary##*/}
      ln -s "../lib/llvm$_pkgver_major/bin/$_basename" "$pkgdir/usr/bin/$_basename-$_pkgver_major"
    done

    # Remove generic llvm libraries
    rm "$pkgdir/$_llvm_install_dir"/lib/lib{LLVM,LTO,Remarks}.so
  fi

  # The runtime libraries go into llvm$_pkgver_major-libs
  mv -f "$pkgdir/$_llvm_install_dir"/lib/lib{LLVM,LLVM-$_pkgver_major,LTO,Remarks}.so* "$srcdir"
  mv -f "$pkgdir/$_llvm_install_dir"/lib/LLVMgold.so "$srcdir"

  # Remove documentation sources
  rm -r "$pkgdir/$_llvm_install_dir"/share/doc/llvm/html/{_sources,.buildinfo}

  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_llvm18-libs() {
  pkgdesc="LLVM $_pkgver_major runtime libraries"
  depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2')

  install -d "$pkgdir/$_llvm_install_dir/lib"

  cp -P \
    "$srcdir"/lib{LLVM,LLVM-$_pkgver_major,LTO,Remarks}.so* \
    "$pkgdir"/usr/lib/

  cp -P \
    "$srcdir"/LLVMgold.so \
    "$pkgdir/$_llvm_install_dir"/lib

  if [[ "$_build_main_package" = true ]]; then

    # Symlink LLVMgold.so from /usr/lib/bfd-plugins
    # https://bugs.archlinux.org/task/28479
    install -d "$pkgdir/usr/lib/bfd-plugins"
    ln -s ../LLVMgold.so "$pkgdir/usr/lib/bfd-plugins/LLVMgold.so"
  else

    # Symlinks from llvm install dir
    ln -s "../../libLLVM.so.$_pkgver_major.$_pkgver_minor"    "$pkgdir/$_llvm_install_dir/lib/libLLVM.so"
    ln -s "../../libLLVM.so.$_pkgver_major.$_pkgver_minor"    "$pkgdir/$_llvm_install_dir/lib/libLLVM-$_pkgver_major.so"
    ln -s "../../libLLVM.so.$_pkgver_major.$_pkgver_minor"    "$pkgdir/$_llvm_install_dir/lib/libLLVM.so.$_pkgver_major.$_pkgver_minor"

    ln -s "../../libLTO.so.$_pkgver_major.$_pkgver_minor"     "$pkgdir/$_llvm_install_dir/lib/libLTO.so"
    ln -s "../../libLTO.so.$_pkgver_major.$_pkgver_minor"     "$pkgdir/$_llvm_install_dir/lib/libLTO.so.$_pkgver_major.$_pkgver_minor"

    ln -s "../../libRemarks.so.$_pkgver_major.$_pkgver_minor" "$pkgdir/$_llvm_install_dir/lib/libRemarks.so"
    ln -s "../../libRemarks.so.$_pkgver_major.$_pkgver_minor" "$pkgdir/$_llvm_install_dir/lib/libRemarks.so.$_pkgver_major.$_pkgver_minor"
  fi

  install -Dm644 "$srcdir/llvm-$pkgver.src/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

