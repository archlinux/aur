# Maintainer: Damian Höster <damian.hoester@posteo.de>

_pkgname=mrdocs
pkgname=$_pkgname-git
pkgver=0.8.0.r209.faea11b9c.clang24.0.0.f33323e9
pkgrel=1
pkgdesc='C++ documentation generator (git version; built with LLVM matching system clang)'
arch=(x86_64)
url=https://www.mrdocs.com
license=('Apache-2.0 WITH LLVM-exception')
depends=(
  fmt
  gcc-libs
  glibc
  zstd
)
makedepends=(
  clang
  cmake
  git
  ninja
  python
)
provides=($_pkgname)
conflicts=($_pkgname)
source=(
  $_pkgname::git+https://github.com/cppalliance/mrdocs.git
  llvm-project::git+https://github.com/llvm/llvm-project.git
)
sha256sums=(
  SKIP
  SKIP
)

pkgver() {
  local _mrdocs_ver _ver_str _commit _semver _clang_suffix

  _mrdocs_ver=$(git -C $_pkgname describe --long --tags |
    sed -E 's/^v//; s/-([^-]*)-g([^-]*)$/.r\1.\2/; s/-/./g')

  _ver_str=$(clang --version 2>/dev/null | head -n1 || true)
  _commit=$(echo "$_ver_str" | grep -oE '[0-9a-f]{40}' || true)
  _semver=$(echo "$_ver_str" | grep -oP 'clang version \K[0-9]+\.[0-9]+\.[0-9]+' || true)

  if [[ -n $_commit ]]; then
    _clang_suffix=".clang${_semver}.${_commit:0:8}"
  elif [[ -n $_semver ]]; then
    _clang_suffix=".clang${_semver}"
  else
    _clang_suffix=''
  fi

  printf '%s%s' "$_mrdocs_ver" "$_clang_suffix"
}

prepare() {
  local _ver_str _commit _semver
  _ver_str=$(clang --version 2>/dev/null | head -n1 || true)
  _commit=$(echo "$_ver_str" | grep -oE '[0-9a-f]{40}' || true)
  _semver=$(echo "$_ver_str" | grep -oP 'clang version \K[0-9]+\.[0-9]+\.[0-9]+' || true)

  # Check out matching commit (for git packages) or official release tag
  if [[ -n $_commit ]]; then
    msg2 "Checking out system Clang commit: $_commit"
    git -C llvm-project checkout --force "$_commit"
  elif [[ -n $_semver ]] && git -C llvm-project rev-parse "llvmorg-$_semver" >/dev/null 2>&1; then
    msg2 "Checking out system Clang release tag: llvmorg-$_semver"
    git -C llvm-project checkout --force "llvmorg-$_semver"
  else
    msg2 "Defaulting to LLVM main branch"
    git -C llvm-project checkout --force main
  fi

  # Ensure LLVM embeds canonical upstream repository info in version strings.
  git -C llvm-project remote set-url origin https://github.com/llvm/llvm-project.git

  rm -rf $_pkgname/build/third-party/source/llvm
  mkdir -p $_pkgname/build/third-party/source/llvm
  cp -ra llvm-project/* $_pkgname/build/third-party/source/llvm/
  cp -ra llvm-project/.git $_pkgname/build/third-party/source/llvm/ 2>/dev/null || true

  cd $_pkgname
  python bootstrap.py --yes --skip-build --no-run-configs
}

build() {
  cmake -S $_pkgname -B build --preset release-linux
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_pkgname/LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
