# Maintainer: asafelobotomy
# Builds from the tagged GitHub Release's source tarball (the AUR package). To build this
# checkout instead, run scripts/build-local-pkg.sh (it swaps the source for `git archive HEAD`).
# pkgver is the Cargo.toml version with '-rc.N' written 'rcN' (pacman forbids '-');
# scripts/bump-version.sh keeps them in step.
pkgname=kyko
pkgver=1.3.4
pkgrel=1
_tag=${pkgver/rc/-rc.}
pkgdesc="Drop-down terminal for uQ and other Wayland desktops"
arch=(x86_64)
url="https://github.com/asafelobotomy/kyko"
license=(MIT)
depends=(gcc-libs qt6-base qt6-declarative qt6-wayland layer-shell-qt)
makedepends=(cargo qt6-shadertools)
optdepends=('xdg-utils: open links'
            'less: Ctrl+Shift+H shows the scrollback in a pager'
            'libcanberra: terminal.bell = "sound"'
            'unicode-character-database: Ctrl+Shift+U finds characters by name')
# The end-to-end tests run less as their full-screen program.
checkdepends=(less)
options=(!lto)
# The release asset, not GitHub's /archive/ tarball: that one is generated on demand and its bytes
# (so its checksum) can change. The release workflow uploads exactly this file and prints its sum.
source=("$pkgname-$_tag.tar.gz::$url/releases/download/v$_tag/$pkgname-$_tag.tar.gz")
# The release asset's sha256 for this tag; SKIP until the first release, then update it with
# pkgver at each release.
sha256sums=('0b6c2c0b5ee8929445d644b209c8a83024f616ae48d622d6189db6c756693fee')

conflicts+=('uq<0.3.41')  # uq-compat: from uQ's compat/family.toml

prepare() {
  cd "$srcdir/$pkgname-$_tag"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-$_tag"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p kyko -p kykod -p kyko-prompt
}

check() {
  # Every release's tests passed in CI before it was tagged. Running them again while the
  # package installs only makes setup longer, and a test that needs a terminal or a
  # session can fail in a clean build. UQ_CHECK=1 runs them.
  [ -n "${UQ_CHECK:-}" ] || { msg2 'skipping tests (CI runs them; set UQ_CHECK=1 to run)'; return 0; }
  cd "$srcdir/$pkgname-$_tag"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --workspace
}

package() {
  cd "$srcdir/$pkgname-$_tag"
  install -Dm755 target/release/kyko "$pkgdir/usr/bin/kyko"
  install -Dm755 target/release/kykod "$pkgdir/usr/bin/kykod"
  install -Dm755 target/release/kyko-prompt "$pkgdir/usr/bin/kyko-prompt"
  # A user unit, installed but not enabled.
  install -Dm644 packaging/kykod.service "$pkgdir/usr/lib/systemd/user/kykod.service"
  install -Dm644 packaging/kyko.service "$pkgdir/usr/lib/systemd/user/kyko.service"
  # `kyko toggle` and the first Run start the drop-down through D-Bus activation.
  install -Dm644 packaging/org.kyko.Terminal1.service "$pkgdir/usr/share/dbus-1/services/org.kyko.Terminal1.service"
  install -Dm644 packaging/org.kyko.Kyko.desktop "$pkgdir/usr/share/applications/org.kyko.Kyko.desktop"
  install -Dm644 packaging/org.kyko.Kyko.metainfo.xml "$pkgdir/usr/share/metainfo/org.kyko.Kyko.metainfo.xml"
  install -Dm644 packaging/org.kyko.Kyko.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.kyko.Kyko.svg"
  # uQ's Spotlight lists kyko's open tabs.
  install -Dm644 packaging/kyko.provider "$pkgdir/usr/share/uq/launcher/kyko.provider"
  # What each of kyko's problem codes means, for `uqctl explain` and Settings › Problems.
  install -Dm644 uq/diag/kyko.toml "$pkgdir/usr/share/uq/diag/kyko.toml"
  # The drop-down's page in uQ Settings (Apps > kyko).
  install -Dm644 -t "$pkgdir/usr/share/uq/settings/pages/kyko/" uq/pages/kyko/*
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # The built-in themes are uQ's; their credits and licences.
  install -Dm644 crates/kyko-core/themes/CREDITS.md "$pkgdir/usr/share/licenses/$pkgname/THEMES.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
