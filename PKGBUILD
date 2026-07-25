# Maintainer: Alain Abbasi <abbasi.alain@gmail.com>
pkgname=atlas
pkgver=0.7.0
pkgrel=1
pkgdesc="ATLAS — Agentic Harness Standard. 10-30x fewer agent orientation tokens. Zero infrastructure."
arch=('any')
url="https://github.com/Abbasi-Alain/atlas"
license=('MIT')
depends=('bash' 'git')
optdepends=('github-cli: for atlas auth/repo/mirror'
            'glab: for GitLab integration'
            'jq: for some adapter installers')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Abbasi-Alain/atlas/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('98ee9b0ab21edbcfb779745555473e535ac1aea1c95c6d9731e7ecaa8ea29662')

package() {
  cd "$srcdir/atlas-${pkgver}"

  # Drop the source tree under /usr/share/atlas
  install -d "$pkgdir/usr/share/atlas"
  cp -R bin templates adapters hooks "$pkgdir/usr/share/atlas/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/SPEC.md "$pkgdir/usr/share/doc/$pkgname/SPEC.md"

  # Launcher in /usr/bin
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/atlas" <<'LAUNCHER'
#!/usr/bin/env bash
export ATLAS_HOME="/usr/share/atlas"
exec "/usr/share/atlas/bin/atlas" "$@"
LAUNCHER
  chmod 0755 "$pkgdir/usr/bin/atlas"
}
