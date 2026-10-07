# Maintainer: Damian Höster <damian.hoester@posteo.de>

_pkgname=hylo
pkgname=$_pkgname-git
pkgver=0.0.9.r51.e674623d
pkgrel=1
pkgdesc='Compiler for the Hylo programming language'
arch=(x86_64 aarch64)
url=https://hylo-lang.org
license=(Apache-2.0)
depends=(
  clang
  gcc-libs
  glibc
  swift-language
)
makedepends=(
  curl
  git
  pkgconf
  tar
  zstd
)
provides=($_pkgname)
conflicts=($_pkgname)
source=(
  $_pkgname::git+https://github.com/hylo-lang/hylo-new.git
  git+https://github.com/hylo-lang/Swifty-LLVM.git
)
sha256sums=(
  SKIP
  SKIP
)

pkgver() {
  git -C $_pkgname describe --long --tags |
    sed -E 's/^v//; s/-([^-]*)-g([^-]*)$/.r\1.\2/; s/-/./g'
}

_get_llvm() {
  local _llvm_ver _llvm_rel _llvm_tar _llvm_dir _rel_yml
  _rel_yml="$srcdir/$_pkgname/.github/workflows/release.yml"
  _llvm_ver=$(grep -m1 'llvmVersion:' "$_rel_yml" | tr -d ' "[:space:]' | cut -d: -f2)
  _llvm_rel=$(grep -m1 'llvmBuildRelease:' "$_rel_yml" | tr -d ' "[:space:]' | cut -d: -f2)
  _llvm_tar=llvm-"$_llvm_ver-$CARCH-$_llvm_rel"-MinSizeRel.tar.zst
  _llvm_dir="$srcdir/llvm-$_llvm_rel"

  if [[ ! -d "$_llvm_dir" ]]; then
    if [[ ! -f "$srcdir/$_llvm_tar" ]]; then
      local _gh='https://github.com/hylo-lang/llvm-build/releases/download'
      local _artifact="llvm-$_llvm_ver-$CARCH-unknown-linux-gnu-MinSizeRel"
      msg2 "Downloading prebuilt LLVM $_llvm_ver ($_llvm_rel)..."
      curl -fL "$_gh/$_llvm_rel/$_artifact.tar.zst" -o "$srcdir/$_llvm_tar"
    fi
    msg2 "Extracting prebuilt LLVM..."
    mkdir -p "$_llvm_dir"
    bsdtar -xf "$srcdir/$_llvm_tar" -C "$_llvm_dir" --strip-components=1
  fi

  export PKG_CONFIG_PATH="$_llvm_dir/pkgconfig:$_llvm_dir/lib/pkgconfig:$PKG_CONFIG_PATH"
  export PATH="$_llvm_dir/bin:$PATH"
}

prepare() {
  cd $_pkgname
  git config submodule.Swifty-LLVM.url "$srcdir/Swifty-LLVM"
  git -c protocol.file.allow=always submodule update Swifty-LLVM
  printf 'internal let hyloVersion = "%s"\n' "$pkgver" >Sources/hc/Version.swift

  _get_llvm
}

build() {
  cd $_pkgname
  _get_llvm

  swift build \
    --configuration release \
    --disable-sandbox \
    -Xswiftc -file-prefix-map -Xswiftc "$srcdir=" \
    -Xcc -ffile-prefix-map="$srcdir=" \
    -Xswiftc -DUSE_BUNDLED_STANDARD_LIBRARY \
    -Xswiftc -DSWIFTY_LLVM_CROSS_COMPILATION_ENABLED \
    -Xswiftc -package-name -Xswiftc swift-subprocess
}

check() {
  cd $_pkgname
  _get_llvm

  swift test \
    --configuration release \
    --disable-sandbox \
    --parallel
}

package() {
  cd $_pkgname

  local _bin_dir
  _bin_dir=$(find "$srcdir/$_pkgname/.build" -type f -name hc -exec dirname {} + | head -n1)

  # Install private binaries and resources
  install -Dm755 "$_bin_dir/hc" -t "$pkgdir"/usr/lib/$_pkgname
  install -Dm755 "$_bin_dir/hylo-demangle" -t "$pkgdir"/usr/lib/$_pkgname

  # Copy resource bundles if generated
  for _bundle in "$_bin_dir"/*.bundle; do
    [[ -e $_bundle ]] && cp -r "$_bundle" "$pkgdir"/usr/lib/$_pkgname
  done

  install -dm755 "$pkgdir"/usr/bin
  ln -s /usr/lib/$_pkgname/hc "$pkgdir"/usr/bin/hc
  ln -s /usr/lib/$_pkgname/hc "$pkgdir"/usr/bin/hylo
  ln -s /usr/lib/$_pkgname/hylo-demangle "$pkgdir"/usr/bin/hylo-demangle

  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
