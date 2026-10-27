# Maintainer: Damian Höster <damian.hoester@posteo.de>

_pkgname=bde-verify
pkgname=$_pkgname-git
pkgver=1.5.1.r1208.a03bd7b
pkgrel=1
pkgdesc='Static analysis tool verifying adherence to BDE C++ coding standards'
arch=(x86_64)
url=https://bloomberg.github.io/bde_verify/
license=(Apache-2.0)

depends=(
  aspell
  clang21
  gcc-libs
  glibc
  llvm21-libs
  perl
  which
)

makedepends=(
  cmake
  git
  llvm21
  ninja
)

optdepends=(
  'aspell-en: English dictionary for spell checking'
)

provides=(
  $_pkgname
  bde_verify
)
conflicts=(
  $_pkgname
  bde_verify
)

source=($_pkgname::git+https://github.com/bloomberg/bde_verify.git)
sha256sums=(SKIP)

pkgver() {
  local _ver _rev _hash
  _ver=$(sed -n 's/^bde-verify (\([^)]*\)).*/\1/p' $_pkgname/debian/changelog 2>/dev/null | head -n1)
  [[ -z $_ver ]] && _ver=1.5.1
  _rev=$(git -C $_pkgname rev-list --count HEAD)
  _hash=$(git -C $_pkgname rev-parse --short HEAD)
  printf '%s.r%s.%s' "$_ver" "$_rev" "$_hash"
}

prepare() {
  # On Arch Linux, Clang component libraries are packaged into the unified clang-cpp and LLVM shared libraries
  sed -i \
    -e /clangTooling/d \
    -e /clangFrontendTool/d \
    -e 's/clangFrontend/clang-cpp LLVM/' \
    $_pkgname/CMakeLists.txt

  # Ensure bde_verify_bin can locate LLVM 21 shared libraries at runtime
  sed -i 's|\${CMAKE_INSTALL_PREFIX}/lib64|/usr/lib/llvm21/lib|' \
    $_pkgname/CMakeLists.txt
}

build() {
  export CFLAGS+=" -ffile-prefix-map=$srcdir=."
  export CXXFLAGS+=" -ffile-prefix-map=$srcdir=."

  if [[ -x /usr/lib/llvm21/bin/clang++ ]]; then
    export CC=/usr/lib/llvm21/bin/clang
    export CXX=/usr/lib/llvm21/bin/clang++
  fi

  local cmake_args=(
    -S $_pkgname
    -B build
    -G Ninja
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D Clang_DIR=/usr/lib/llvm21/lib/cmake/clang
    -D LLVM_DIR=/usr/lib/llvm21/lib/cmake/llvm
    -D CLANG_RESOURCE_DIR=/usr/lib/llvm21/lib/clang/21
  )

  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Provide configuration in standard /etc hierarchy while keeping compatibility symlink
  if [[ -d "$pkgdir"/usr/etc/bde-verify ]]; then
    install -dm755 "$pkgdir"/etc
    mv "$pkgdir"/usr/etc/bde-verify "$pkgdir"/etc/
    ln -s /etc/bde-verify "$pkgdir"/usr/etc/bde-verify
  fi

  # Relocate library files to /usr/lib if installed under /usr/lib64
  if [[ -d "$pkgdir"/usr/lib64 ]]; then
    install -dm755 "$pkgdir/usr/lib"
    mv "$pkgdir"/usr/lib64/* "$pkgdir"/usr/lib/ 2>/dev/null || true
    rmdir "$pkgdir"/usr/lib64 2>/dev/null || true
  fi

  install -Dm644 $_pkgname/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 $_pkgname/README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
