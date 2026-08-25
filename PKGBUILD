# Maintainer: Ayan De <deayan252@gmail.com>

# Headless companion binary for the omarchy-tokentracker shell plugin.
#
# This is deliberately not the desktop app: the widget only needs
# `tokentracker snapshot`, so this package builds the backend crate alone and
# pulls in none of the GUI stack (webkit2gtk, gtk3, appindicator) that
# tokentracker-bin requires. Both can be installed side by side; they share the
# same cache and settings under ~/.config/CodexBar.
#
# VCS package: the snapshot subcommand is not in a tagged release yet. Switch
# source= to a release tarball and drop pkgver() once one exists.

pkgname=tokentracker-cli
pkgver=0.1.12.r42.g3dddb8f
pkgrel=1
pkgdesc="Headless AI provider quota reporter — JSON snapshots for bars and scripts"
arch=('x86_64' 'aarch64')
url="https://github.com/ayan-de/Token-Tracker"
license=('MIT')
# The binary links only glibc and libgcc: reqwest is built with rustls rather
# than OpenSSL, and rusqlite bundles SQLite, so neither is a runtime dependency.
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo')
provides=('tokentracker-cli')
# Arch enables LTO globally. The `ring` crate (pulled in by rustls) links
# prebuilt assembly that LTO discards, so the build dies with undefined
# ring_core_* symbols at link time.
options=('!lto')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Only the backend crate: src-tauri would drag in the whole desktop toolchain.
  cargo build --frozen --release --package backend
}

check() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Restricted to the snapshot contract the widget depends on; the wider suite
  # reaches for network and provider credentials that are absent in a chroot.
  cargo test --frozen --release --package backend -- snapshot widget_snapshot
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/backend" "$pkgdir/usr/bin/tokentracker-cli"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
