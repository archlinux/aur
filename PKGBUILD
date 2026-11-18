# Maintainer: Mohammadreza Khani
# This PKGBUILD is updated by CI on tagged releases (see packaging/arch/publish-aur.sh).
# Hand-edits are fine but will be overwritten on the next tagged release.

pkgname=pareto-ai
pkgver=0.1.2
pkgrel=1
pkgdesc="Pareto AI: local AI model router with a spend and quality console (headless server)"
arch=('x86_64')
url="https://github.com/mohamadkhani/pareto-ai"
license=('MIT')
depends=(
  'glibc'
  'gcc-libs'
)
makedepends=(
  'cargo'
  'git'
  'rust'
  'nodejs'
  'pnpm'
)
# The desktop family bundles its own gateway copy, so the two families cannot
# be co-installed (install one at a time).
conflicts=('pareto-ai-desktop' 'pareto-ai-desktop-bin')
# LTO settings live in the workspace's release profile.
options=(!lto)

source=("$pkgname-$pkgver.tar.gz::https://github.com/mohamadkhani/pareto-ai/archive/refs/tags/v${pkgver}.tar.gz")
# Checksum is injected by CI from the real tag tarball (not SKIP).
b2sums=('b37e3874d45de655b6f50414c14f6468a11f0c093d2ccd3474c4d8326a0c5f81e06fea13a137e49cbb263626a5dd7433ee9670a2e13c7f01c0d3378085bb88c3')

build() {
  cd "$srcdir/pareto-ai-${pkgver}"

  # The gateway embeds the Angular console (rust-embed), so the web build must
  # come first (decision D43).
  (cd web && pnpm install --frozen-lockfile && pnpm run build)

  cargo build --locked --release --manifest-path server/Cargo.toml
}

package() {
  cd "$srcdir/pareto-ai-${pkgver}"

  install -Dm755 server/target/release/gateway \
    "$pkgdir/usr/bin/pareto-gateway"

  # Daemon: systemctl enable --now pareto-gateway
  install -Dm644 packaging/arch/pareto-gateway.service \
    "$pkgdir/usr/lib/systemd/system/pareto-gateway.service"
  install -Dm644 packaging/arch/pareto-gateway.sysusers \
    "$pkgdir/usr/lib/sysusers.d/pareto-gateway.conf"
  install -Dm644 packaging/arch/pareto-gateway.conf \
    "$pkgdir/etc/pareto-gateway.conf"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
