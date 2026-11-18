# Maintainer: Mohammadreza Khani
# This PKGBUILD is updated by CI on tagged releases (see packaging/arch/publish-aur.sh).
# Hand-edits are fine but will be overwritten on the next tagged release.

pkgname=pareto-ai-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Pareto AI: local AI model router with a spend and quality console (headless server, prebuilt)"
arch=('x86_64')
url="https://github.com/mohamadkhani/pareto-ai"
license=('MIT')
depends=(
  'glibc'
  'gcc-libs'
)
provides=('pareto-ai')
# The desktop family bundles its own gateway copy, so the two families cannot
# be co-installed (install one at a time).
conflicts=('pareto-ai' 'pareto-ai-desktop' 'pareto-ai-desktop-bin')
source_x86_64=("https://github.com/mohamadkhani/pareto-ai/releases/download/v${pkgver}/pareto-ai-${pkgver}-linux-x86_64.tar.gz")
# Checksum is injected by CI from the built release tarball (real b2sum, not SKIP).
b2sums_x86_64=('c3cd1777773bd84884312d003406b19e161a65f914af73ffbc91b47d17cdda9a0876b53e0ca2a6510d04c0598e4eaa2680eaf617a0139e19396019e20ef83481')

package() {
  cd "$srcdir/pareto-ai-${pkgver}-linux-x86_64"

  install -Dm755 pareto-gateway \
    "$pkgdir/usr/bin/pareto-gateway"

  # Daemon: systemctl enable --now pareto-gateway
  install -Dm644 pareto-gateway.service \
    "$pkgdir/usr/lib/systemd/system/pareto-gateway.service"
  install -Dm644 pareto-gateway.sysusers \
    "$pkgdir/usr/lib/sysusers.d/pareto-gateway.conf"
  install -Dm644 pareto-gateway.conf \
    "$pkgdir/etc/pareto-gateway.conf"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
