# Maintainer: Damian Höster <damian.hoester@posteo.de>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=clang-static-git
pkgver=24.0.0_r592113.4869aae02ba8
pkgrel=1
pkgdesc='Clang compiler and tools with libc++, runtimes, and statically linked LLVM components (git version)'
arch=(x86_64)
url=https://clang.llvm.org/
license=('Apache-2.0 WITH LLVM-exception')
depends=(
  gcc-libs
  glibc
  libedit
  libxml2
  ncurses
  perl
  python
  python-yaml
  zlib
  zstd
)
makedepends=(
  git
  cmake
  ninja
  python
)
optdepends=(
  'openmp: OpenMP support in clang with -fopenmp'
  'lib32-glibc: 32-bit compiler-rt sanitizer runtimes'
  'lib32-gcc-libs: 32-bit compiler-rt sanitizer runtimes'
)
provides=(
  clang=$pkgver
  clang-format=$pkgver
  clang-tools-extra=$pkgver
  clang-analyzer=$pkgver
  clangd=$pkgver
  lld=$pkgver
  compiler-rt=$pkgver
  libc++=$pkgver
  libc++abi=$pkgver
  llvm-libunwind=$pkgver
)
conflicts=(
  clang
  clang-format
  clang-tools-extra
  clang-analyzer
  clangd
  lld
  compiler-rt
  libc++
  libc++abi
  llvm-libunwind
)
options=(
  staticlibs
  !lto
)
source=(llvm-project::git+https://github.com/llvm/llvm-project.git)
sha256sums=(SKIP)

pkgver() {
  cd llvm-project/cmake/Modules

  # Matches output of `llvm-config --version` with dashes replaced by _
  local _count=$(git rev-list --count HEAD)
  local _hash=$(git rev-parse --short HEAD)
  local _ver=$(awk -F 'MAJOR |MINOR |PATCH |)' \
    'BEGIN { ORS="." ; i=0 } \
           /set\(LLVM_VERSION_/ { print $2 ; i++ ; if (i==2) ORS="" } \
           END { print "\n" }' \
    LLVMVersion.cmake)
  echo "${_ver}_r${_count}.${_hash}"
}

_get_distribution_components() {
  local target
  ninja -C _build -t targets | grep -Po 'install-\K.*(?=-stripped:)' |
    while read -r target; do
      case $target in
      clang-libraries | distribution) continue ;;
      clang | clangd | clang-* | \
        lld | lld-* | ld.lld | \
        compiler-rt | compiler-rt-* | clang_rt* | \
        builtins | runtimes | scan-build | scan-view | \
        cxx | cxx-* | cxxabi | cxxabi-*) ;;
      *) continue ;;
      esac
      echo $target
    done
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"

  local cmake_args=(
    -B _build
    -S llvm-project/llvm
    -G Ninja
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_DOCDIR=share/doc
    -D LLVM_ENABLE_PROJECTS='clang;lld;clang-tools-extra'
    -D LLVM_ENABLE_RUNTIMES='compiler-rt;libcxx;libcxxabi;libunwind'
    -D LLVM_BINUTILS_INCDIR=/usr/include
    -D CLANG_DEFAULT_CXX_STDLIB=libstdc++
    -D CLANG_DEFAULT_RTLIB=libgcc
    -D LLVM_BUILD_LLVM_DYLIB=OFF
    -D LLVM_LINK_LLVM_DYLIB=OFF
    -D LLVM_INCLUDE_TESTS=ON
    -D LLVM_INCLUDE_BENCHMARKS=OFF
    -D CLANG_DEFAULT_PIE_ON_LINUX=ON
    -D LLVM_INSTALL_TOOLCHAIN_ONLY=ON
    -Wno-dev
  )

  # Pass 1: Configure targets
  cmake "${cmake_args[@]}"

  # Fetch targeted components
  local _dist_components=$(_get_distribution_components | paste -sd\;)

  # Pass 2: Lock in distribution components
  cmake "${cmake_args[@]}" -D LLVM_DISTRIBUTION_COMPONENTS="$_dist_components"

  # Build only the requested distribution
  ninja -C _build $NINJAFLAGS distribution
}

check() {
  ninja -C _build $NINJAFLAGS check-clang
  ninja -C _build $NINJAFLAGS check-clang-tools
}

package() {
  DESTDIR="$pkgdir" ninja -C _build $NINJAFLAGS install-distribution

  # Remove files that conflict with the llvm package
  rm -f "$pkgdir"/usr/bin/clang-offload-packager
  rm -f "$pkgdir"/usr/bin/llvm-offload-binary

  # Remove LLVM libunwind files that conflict with system (gcc) libunwind
  rm -f "$pkgdir"/usr/lib/libunwind.so
  rm -f "$pkgdir"/usr/include/libunwind.h
  rm -f "$pkgdir"/usr/include/unwind.h

  install -Dm644 llvm-project/llvm/LICENSE.TXT \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # Symlink libc++, libc++abi, and LLVM libunwind.so.1 to /usr/lib
  local _arch_dir="$pkgdir"/usr/lib/x86_64-unknown-linux-gnu
  if [[ -d "$_arch_dir" ]]; then
    for _f in "$_arch_dir"/libc++* "$_arch_dir"/libunwind.so.1*; do
      [[ -e "$_f" ]] && ln -s --relative "$_f" "$pkgdir"/usr/lib/
    done
  fi

  # Move scanbuild-py into site-packages and install Python bindings
  local _site_packages=$(
    python -c "import site; print(site.getsitepackages()[0])"
  )

  if [[ -d "$pkgdir"/usr/lib/libear ]] ||
    [[ -d "$pkgdir"/usr/lib/libscanbuild ]]; then
    install -d "$pkgdir"/$_site_packages

    mv "$pkgdir"/usr/lib/{libear,libscanbuild} \
      "$pkgdir"/$_site_packages/ 2>/dev/null || true

    cp -a llvm-project/clang/bindings/python/clang "$pkgdir"/$_site_packages/
  fi

  # Move analyzer scripts out of /usr/libexec
  if [[ -d "$pkgdir"/usr/libexec ]]; then
    install -d "$pkgdir"/usr/lib/clang
    mv "$pkgdir"/usr/libexec/* "$pkgdir"/usr/lib/clang/
    rmdir "$pkgdir"/usr/libexec

    # Patch paths if the files exist
    [[ -f "$pkgdir"/usr/bin/scan-build ]] &&
      sed -i 's|libexec|lib/clang|' "$pkgdir"/usr/bin/scan-build

    local _analyze_py="$pkgdir"/$_site_packages/libscanbuild/analyze.py
    [[ -f "$_analyze_py" ]] &&
      sed -i 's|libexec|lib/clang|' "$_analyze_py"
  fi

  # Move bash completion
  local bash_completion_destdir="$pkgdir"/usr/share/bash-completion/completions
  if [[ -f "$pkgdir"/usr/share/clang/bash-autocomplete.sh ]]; then
    install -d $bash_completion_destdir
    mv "$pkgdir"/usr/share/clang/bash-autocomplete.sh \
      $bash_completion_destdir/clang
  fi
}
