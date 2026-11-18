# Maintainer: Mohammadreza Khani
# This PKGBUILD is updated by CI on tagged releases (see packaging/arch/publish-aur.sh).
# Hand-edits are fine but will be overwritten on the next tagged release.

pkgname=pareto-ai-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Pareto AI: local AI model router with a spend and quality console (desktop app with system tray and gateway, prebuilt)"
arch=('x86_64')
url="https://github.com/mohamadkhani/pareto-ai"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libayatana-appindicator'
  'hicolor-icon-theme'
)
provides=('pareto-ai')
# The desktop bundles its own gateway copy, so the lighter server-only
# packages cannot be co-installed (install one family at a time).
conflicts=('pareto-ai' 'pareto-gateway' 'pareto-gateway-bin')
source_x86_64=("https://github.com/mohamadkhani/pareto-ai/releases/download/v${pkgver}/pareto-ai-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
# Checksum is injected by CI from the built release tarball (real b2sum, not SKIP).
b2sums_x86_64=('26517a1cfd8113649a2bca20f3e9bbf4524d9a394e66e2694f54d52203d2829669218ce84c403e92435ab68cd0fb6081ea0d80d5f303a74e261e6d9bfeebd310')

package() {
  install -Dm755 "$srcdir/pareto-desktop" \
    "$pkgdir/usr/bin/pareto-desktop"

  # The shell finds the sidecar in ../lib/pareto-desktop/ next to /usr/bin
  # (see sidecar_path() in desktop/src/main.rs).
  install -Dm755 "$srcdir/pareto-gateway" \
    "$pkgdir/usr/lib/pareto-desktop/pareto-gateway"
  # ...and the same binary is on PATH, so the gateway can also run headless.
  ln -s ../lib/pareto-desktop/pareto-gateway "$pkgdir/usr/bin/pareto-gateway"

  # Daemon for the gateway copy: systemctl enable --now pareto-gateway
  install -Dm644 "$srcdir/pareto-gateway.service" \
    "$pkgdir/usr/lib/systemd/system/pareto-gateway.service"
  install -Dm644 "$srcdir/pareto-gateway.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/pareto-gateway.conf"
  install -Dm644 "$srcdir/pareto-gateway.conf" \
    "$pkgdir/etc/pareto-gateway.conf"

  install -Dm644 "$srcdir/pareto-ai.desktop" \
    "$pkgdir/usr/share/applications/pareto-ai.desktop"
  install -Dm644 "$srcdir/pareto-ai.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/pareto-ai.png"

  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
