# Maintainer: 0443n <noreply@github.com>
# Builds burrow (CLI + desktop app + privileged VPN helper) from a release tag.
# On a version bump: update pkgver, run `updpkgsums` to refresh sha256sums, then
# `makepkg --printsrcinfo > .SRCINFO` before committing/pushing to the AUR.
# The bare `burrow` is taken on the AUR by an unrelated project, so this is
# published as `burrow-tunnel`. `_pkgname` is the upstream GitHub repo name — the
# release tarball still extracts to `burrow-$pkgver`.
_pkgname=burrow
pkgname=burrow-tunnel
pkgver=0.3.1
pkgrel=1
pkgdesc="Turn any SSH server into a local proxy and a system-wide VPN"
arch=('x86_64')
url="https://github.com/0443n/burrow"
license=('GPL-3.0-or-later')
# polkit: the privileged VPN helper. The rest are the desktop app's runtime libs,
# loaded at runtime by Slint's winit + femtovg (OpenGL) backend — so they don't
# show up in `ldd` but are required for the GUI to start (Wayland and X11 both).
depends=('polkit' 'fontconfig' 'libglvnd' 'wayland' 'libxkbcommon'
         'libx11' 'libxcb' 'libxcursor' 'libxi' 'hicolor-icon-theme')
makedepends=('cargo' 'cmake')
# makepkg's global LTO injects -flto into the C build of the crypto backend
# (aws-lc-sys), producing bitcode-only objects the Rust link can't consume ->
# "undefined symbol: aws_lc_*". Disabling intermediate LTO fixes it; Rust's own
# release-profile LTO is unaffected. Per Arch's Rust package guidelines.
options=('!lto')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7c69c0b39e36443b26355642de1e6549afb46c26ac9a9c06eccc50a268a0e7b0')

build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/burrow        "$pkgdir/usr/bin/burrow"
  install -Dm755 target/release/burrow-ui     "$pkgdir/usr/bin/burrow-ui"
  install -Dm755 target/release/burrow-helper "$pkgdir/usr/bin/burrow-helper"
  install -Dm644 packaging/burrow.desktop          "$pkgdir/usr/share/applications/burrow.desktop"
  install -Dm644 packaging/io.burrow.helper.policy "$pkgdir/usr/share/polkit-1/actions/io.burrow.helper.policy"

  install -Dm644 burrow.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/burrow.svg"
  for s in 16 24 32 48 64 128 256 512; do
    install -Dm644 "packaging/icons/burrow-$s.png" \
      "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/burrow.png"
  done
}
