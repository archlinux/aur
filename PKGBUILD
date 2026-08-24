# Maintainer: bageljr <bageljr 897 at protonmail dot com>
# Maintainer: dmitmel <dmytro dot meleshko at gmail dot com>
# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=codelldb
_pkgname="$pkgname"
pkgver=1.12.3
pkgrel=1
pkgdesc="A native debugger extension for VSCode based on LLDB. Also known as vscode-lldb (NOT lldb-vscode)"
arch=(x86_64 arm7h aarch64)
url="https://github.com/vadimcn/codelldb"
license=(MIT)
provides=("$_pkgname" "vscode-lldb")
depends=(lldb)
makedepends=(cmake cargo nodejs npm python libc++)
options=(!lto)
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname-update-yargs.patch")
sha256sums=('8a7d183014766e695d90c14c3a4f24a5e7937eb7b0d4954b074a85bd00f4f841'
            '8df7ea2bd651222ff0c47058e15202fe3366490d7ad3c380a54fd09a1c105dd7')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$_pkgname-$pkgver"

  # This patch is necessary to make it possible to run the tests with Node.js
  # v25.7.0 and newer (see https://github.com/yargs/yargs/issues/2509)
  patch --forward --strip=1 --input="$srcdir/$pkgname-update-yargs.patch"

  # The tests break if the flags `--remap-path-prefix=...` or `-ffile-prefix-map=...` are given to
  # C/C++/Rust compilers when building the debuggee. These flags are supplied by `makepkg` through
  # environment variables `CFLAGS`, `CXXFLAGS` and `RUSTFLAGS` to ensure that executables in the
  # built package don't contain references to `$srcdir`. Fortunately, the debuggee executable is
  # built in a separate CMake project, which can easily be isolated in order to not receive the
  # those flags.
  local _pat='${CMAKE_COMMAND} \(${CMAKE_SOURCE_DIR}\|--build ${CMAKE_CURRENT_BINARY_DIR}\)\/debuggee'
  local _rep='${CMAKE_COMMAND} -E env --unset=CFLAGS --unset=CXXFLAGS --unset=RUSTFLAGS --unset=LDFLAGS &'
  sed -i "s/$_pat/$_rep/g" ./CMakeLists.txt

  if [[ "$(cargo build --help)" == *--artifact-dir* ]]; then
    # The `--out-dir` option was renamed to `--artifact-dir` in 1.81.0 and the old name was
    # deleted entirely in 1.95.0.
    sed -i 's/--out-dir/--artifact-dir/g' ./debuggee/CMakeLists.txt
  fi

  # This change is necessary for building the package with Clang >= 20. However, it breaks
  # compatibility of the package with LLDB < 18. This shouldn't be a problem since it is linked
  # with the system installation of LLDB, whose version will be the same as that of Clang's and
  # the rest of LLVM.
  # sed -i 's|^\(\s*\)\(.*is_default_constructible<lldb::SBCommandInterpreter>.*\)$|\1//\2|' \
  #   ./src/lldb/src/sb/sbcommandinterpreter.rs

  cargo fetch --locked --target="$(rustc --print host-tuple)"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$_pkgname-$pkgver"

  local cmake_options=(
    # For building the package with Clang:
    # -DCMAKE_TOOLCHAIN_FILE="$PWD/cmake/toolchain-$(rustc --print host-tuple | cut -d- -f1,3-).cmake"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DLLDB_PACKAGE=/usr
    -DLLVM_SOURCE_DIR="$PWD"
    -DCMAKE_CTEST_ARGUMENTS="--verbose"
    -DTEST_TIMEOUT=20000
  )

  cmake -B build -Wno-dev "${cmake_options[@]}"
  cmake --build build --target adapter debuggee adapter_tests
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$_pkgname-$pkgver"
  ctest --test-dir build --verbose -R '^adapter'
}

package() {
  cd "$_pkgname-$pkgver"
  local libdir="$pkgdir/usr/lib/$_pkgname"

  (
    cd build
    shopt -s globstar nullglob

    # Files that need to be installed:
    # https://github.com/vadimcn/codelldb/blob/v1.12.1/CMakeLists.txt#L182-L197

    install -Dm644 -t "$libdir" platform.ok

    local file; for file in adapter/codelldb adapter/*.so bin/codelldb-launch; do
      install -Dm755 "$file" "$libdir/$file"
    done

    local file; for file in adapter/scripts/**/*.py formatters/**/*.py lang_support/**/*.py; do
      install -Dm644 "$file" "$libdir/$file"
    done
  )

  install -d "$libdir"/lldb
  ln -s -t "$libdir"/lldb /usr/{bin,lib}

  install -d "$pkgdir"/usr/bin
  ln -s -t "$pkgdir"/usr/bin /usr/lib/"$_pkgname"/{adapter/codelldb,bin/codelldb-launch}

  install -Dm644 -t "$pkgdir"/usr/share/licenses/"$_pkgname" LICENSE
}
