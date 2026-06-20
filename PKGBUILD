# Maintainer: Alain Abbasi <abbasi.alain@gmail.com>
pkgname=atlas
pkgver=0.4.1
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
sha256sums=('9a7302ea060c0d1993dac798369492a090e2fa9c9fedd8d265d0d17298d7de79')

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
