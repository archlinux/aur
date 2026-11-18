# Maintainer: Mohammadreza Khani
# This PKGBUILD is updated by CI on tagged releases (see packaging/arch/publish-aur.sh).
# Hand-edits are fine but will be overwritten on the next tagged release.

pkgname=pareto-ai
pkgver=0.1.0
pkgrel=1
pkgdesc="Pareto AI: local AI model router with a spend and quality console (desktop app with system tray and gateway)"
arch=('x86_64')
url="https://github.com/mohamadkhani/pareto-ai"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libayatana-appindicator'
  'hicolor-icon-theme'
)
makedepends=(
  'cargo'
  'git'
  'rust'
  'pkgconf'
  'nodejs'
  'pnpm'
)
# The desktop bundles its own gateway copy, so the lighter server-only
# packages cannot be co-installed (install one family at a time).
conflicts=('pareto-gateway' 'pareto-gateway-bin')
# LTO/strip settings live in the desktop crate's release profile.
options=(!lto)

source=("$pkgname-$pkgver.tar.gz::https://github.com/mohamadkhani/pareto-ai/archive/refs/tags/v${pkgver}.tar.gz")
# Checksum is injected by CI from the real tag tarball (not SKIP).
b2sums=('1ad27869b93e101ab37bb4edfd01db0e95abdeb3b77c665f0d6962e6a3ba4b1b92dc76c7f4e1ae55141a0db3e1945db703bc0f90a5383e64562d3827e18d05b9')

build() {
  cd "$srcdir/pareto-ai-${pkgver}"

  # The gateway embeds the Angular console (rust-embed), so the web build must
  # come first (decision D43).
  (cd web && pnpm install --frozen-lockfile && pnpm run build)

  # The gateway server, then the Tauri shell around it. They are separate
  # crates with their own lockfiles, so each builds into its own target dir.
  cargo build --locked --release --manifest-path server/Cargo.toml
  cargo build --locked --release --manifest-path desktop/Cargo.toml
}

package() {
  cd "$srcdir/pareto-ai-${pkgver}"

  install -Dm755 desktop/target/release/pareto-desktop \
    "$pkgdir/usr/bin/pareto-desktop"

  # The shell finds the sidecar in ../lib/pareto-desktop/ next to /usr/bin
  # (see sidecar_path() in desktop/src/main.rs).
  install -Dm755 server/target/release/gateway \
    "$pkgdir/usr/lib/pareto-desktop/pareto-gateway"
  # ...and the same binary is on PATH, so the gateway can also run headless.
  ln -s ../lib/pareto-desktop/pareto-gateway "$pkgdir/usr/bin/pareto-gateway"

  # Daemon for the gateway copy: systemctl enable --now pareto-gateway
  install -Dm644 packaging/arch/pareto-gateway.service \
    "$pkgdir/usr/lib/systemd/system/pareto-gateway.service"
  install -Dm644 packaging/arch/pareto-gateway.sysusers \
    "$pkgdir/usr/lib/sysusers.d/pareto-gateway.conf"
  install -Dm644 packaging/arch/pareto-gateway.conf \
    "$pkgdir/etc/pareto-gateway.conf"

  install -Dm644 packaging/arch/pareto-ai.desktop \
    "$pkgdir/usr/share/applications/pareto-ai.desktop"
  install -Dm644 desktop/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/pareto-ai.png"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
