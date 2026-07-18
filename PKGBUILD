# Maintainer: Viet Anh Nguyen <vietanh.dev@gmail.com>
#
# AUR package for the Bulwark CLI. Built from the tagged source tarball (AUR
# prefers source builds; a -bin variant would shadow the GitHub release .deb we
# already ship). Only `bulwarkctl` is packaged — the Tauri GUI needs WebKitGTK and
# is distributed as Flatpak/Snap/AppImage instead.
pkgname=bulwarkctl
pkgver=0.8.3
pkgrel=1
pkgdesc="Linux host security and misconfiguration scanner (CLI)"
arch=('x86_64')
url="https://github.com/vietanhdev/bulwark"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
# !lto is required, not cosmetic. libsqlite3-sys builds SQLite from source (the
# workspace enables its `bundled` feature), and makepkg enables LTO by default, so
# the cc crate compiles sqlite3.c into LTO-bytecode objects that rustc's lld link
# cannot resolve — the build dies with "undefined symbol: sqlite3_bind_null" even
# though the bundled feature is active. Disabling LTO makes the C objects linkable.
options=('!lto')
# ClamAV powers the optional antivirus scan; everything else works without it and
# Bulwark prints a distro-aware install hint when it is absent.
optdepends=('clamav: antivirus scanning support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('267d155a7fba39aa6195e13624398b551fcbdf68a6a61b089cfb1f195511efef')

prepare() {
  cd "bulwark-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "bulwark-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # -p bulwarkctl: build only the CLI and its library, never the Tauri GUI member
  # (which would need WebKitGTK).
  cargo build --frozen --release -p bulwarkctl
}

package() {
  cd "bulwark-$pkgver"
  install -Dm0755 "target/release/bulwarkctl" "$pkgdir/usr/bin/bulwarkctl"

  # The rule pack is load-bearing, not dressing: on an installed system
  # resolve_rules_dir falls back to /usr/share/bulwark/rules, so a package without
  # it fails on every invocation.
  install -d "$pkgdir/usr/share/bulwark"
  cp -r rules decoders log-rules "$pkgdir/usr/share/bulwark/"
  find "$pkgdir/usr/share/bulwark" -type f -exec chmod 0644 {} +
  find "$pkgdir/usr/share/bulwark" -type d -exec chmod 0755 {} +

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
