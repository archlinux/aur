# Maintainer: AE Firefly Labs <fireflylabss@users.noreply.github.com>

pkgname=option-term
pkgver=0.1.4
pkgrel=1
pkgdesc='GTK4 + libadwaita terminal emulator powered by libghostty-vt'
arch=('x86_64')
url='https://github.com/fireflylabss/optionTerm'
license=('Apache-2.0')
depends=(
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk4'
  'libadwaita'
  'cairo'
  'pango'
)
makedepends=(
  'cargo'
)
# libghostty-vt-sys builds the vendored Ghostty VT with Zig and only supports
# 0.15.x, while extra/zig is already 0.16 — ship the upstream 0.15.2 toolchain
# for the build instead of patching the crate.
_zigver=0.15.2
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "zig-x86_64-linux-$_zigver.tar.xz::https://ziglang.org/download/$_zigver/zig-x86_64-linux-$_zigver.tar.xz"
)
sha256sums=(
  '355bf343039e385a30df7fc9731c59f71de7ef6b40018a503b909eb99b16a7fe'
  '02aa270f183da276e5b5920b1dac44a63f1a49e55050ebde3aecc9eb82f93239'
)

_srcdir="optionTerm-$pkgver"

prepare() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export PATH="$srcdir/zig-x86_64-linux-$_zigver:$PATH"
  cargo build --frozen --release
}

check() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export PATH="$srcdir/zig-x86_64-linux-$_zigver:$PATH"
  cargo test --frozen --release
}

package() {
  cd "$_srcdir"
  install -Dm755 "target/release/option-term" "$pkgdir/usr/bin/option-term"
  install -Dm644 "packaging/labs.firefly.optionTerm.desktop" \
    "$pkgdir/usr/share/applications/labs.firefly.optionTerm.desktop"
  install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 'CHANGELOG.md' "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
