# Maintainer: Mohammadreza Khani
# This PKGBUILD is updated by CI on tagged releases (see packaging/arch/publish-aur.sh).
# Hand-edits are fine but will be overwritten on the next tagged release.

pkgname=pareto-gateway
pkgver=0.1.0
pkgrel=1
pkgdesc="Pareto AI gateway: local AI model router with a spend and quality console (headless server)"
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
# LTO settings live in the workspace's release profile.
options=(!lto)

source=("$pkgname-$pkgver.tar.gz::https://github.com/mohamadkhani/pareto-ai/archive/refs/tags/v${pkgver}.tar.gz")
# Checksum is injected by CI from the real tag tarball (not SKIP).
b2sums=('1ad27869b93e101ab37bb4edfd01db0e95abdeb3b77c665f0d6962e6a3ba4b1b92dc76c7f4e1ae55141a0db3e1945db703bc0f90a5383e64562d3827e18d05b9')

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
