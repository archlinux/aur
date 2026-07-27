# Maintainer: JuanJo Ciarlante <jjo@users.noreply.github.com>
#
# Versioned PKGBUILD for the Rust v2.x rewrite.
# Builds the single `drm-colortemp` binary from `Cargo.toml` and ships the
# v2.x systemd unit + notifier scripts.
pkgname=drm-colortemp
pkgver=2.1.0
pkgrel=1
pkgdesc="DRM color temperature control for COSMIC DE (Rust rewrite, wlr-gamma-control workaround)"
arch=('x86_64')
url="https://github.com/jjo/drm-colortemp"
license=('Apache-2.0')
depends=('gcc-libs')
optdepends=('libnotify: desktop notifications')
makedepends=('rust' 'cargo')
backup=('etc/default/drm-colortemp.conf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jjo/drm-colortemp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('35381c42785d9ed2d8590c4b5b603c280d62c0b62ecdd19205d8425c6e820d1a')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/.cargo"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/.cargo"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/.cargo"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  # Single Rust binary (replaces the C-era drm_colortemp + drm_colortemp_daemon).
  install -Dm755 target/release/drm-colortemp-rs "$pkgdir/usr/bin/drm-colortemp"

  # Notifier helpers (still shell scripts in scripts/).
  install -Dm755 scripts/drm-colortemp-notify.sh    "$pkgdir/usr/bin/drm-colortemp-notify.sh"
  install -Dm755 scripts/drm-colortemp-notifier.sh  "$pkgdir/usr/bin/drm-colortemp-notifier.sh"

  # Config file: matches `DEFAULT_DAEMON_CONFIG` in src/main.rs.
  install -Dm644 drm-colortemp.conf "$pkgdir/etc/default/drm-colortemp.conf"

  # Systemd units. drm-colortemp.service is the Rust daemon (--daemon mode);
  # drm-colortemp-notifier.service is the optional desktop notifier.
  install -Dm644 scripts/drm-colortemp.service \
    "$pkgdir/usr/lib/systemd/system/drm-colortemp.service"
  install -Dm644 scripts/drm-colortemp-notifier.service \
    "$pkgdir/usr/lib/systemd/system/drm-colortemp-notifier.service"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Upstream sources hardcode /usr/local/bin; rewrite for distro layout.
  sed -i 's|/usr/local/bin|/usr/bin|g' \
    "$pkgdir/usr/lib/systemd/system/drm-colortemp.service" \
    "$pkgdir/usr/lib/systemd/system/drm-colortemp-notifier.service" \
    "$pkgdir/usr/bin/drm-colortemp-notifier.sh"
}
