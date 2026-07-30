# Maintainer: Firefly Labs <fireflylabss@users.noreply.github.com>

pkgname=optionterm
pkgver=0.1.13
pkgrel=1
pkgdesc='GTK4 + libadwaita terminal emulator powered by libghostty-vt'
arch=('x86_64')
url='https://github.com/fireflylabss/optionTerm'
license=('Apache-2.0')
# Renamed from option-term in 0.1.7; the old package must be replaced, not
# co-installed, since both own /usr/bin/option-term.
conflicts=('option-term')
replaces=('option-term')
provides=('option-term')
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
  # libghostty-vt-sys clones the Ghostty sources during build.rs
  'git'
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
  'b731efae71ba2b9f69914149de074ad3b1cc5a4864fe7639fbeeed75a8145670'
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
  install -Dm755 "target/release/optionterm" "$pkgdir/usr/bin/optionterm"
  # The command was called option-term up to 0.1.6; keep it working.
  ln -s optionterm "$pkgdir/usr/bin/option-term"
  install -Dm644 "packaging/io.option.terminal.desktop" \
    "$pkgdir/usr/share/applications/io.option.terminal.desktop"
  install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 'CHANGELOG.md' "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
