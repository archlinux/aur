# Maintainer: Jerzy Kołosowski <jerzy@kolosowscy.pl>
pkgname=cdev-launcher
pkgver=0.1.1
pkgrel=1
pkgdesc="Claude Code devcontainer launcher (host tooling)"
arch=('any')
url="https://git.kolosowscy.pl/cdev/launcher"
license=('GPL-3.0-or-later')
depends=('python>=3.10' 'podman' 'nodejs' 'npm')
optdepends=('devcontainer: @devcontainers/cli, install via npm i -g @devcontainers/cli')
# The publish pipeline sets pkgver from the git tag, refreshes the source URL and
# checksums (updpkgsums), then regenerates .SRCINFO (makepkg --printsrcinfo).
source=("$pkgname-$pkgver.tar.gz::https://git.kolosowscy.pl/cdev/launcher/-/archive/v$pkgver/launcher-v$pkgver.tar.gz")
sha256sums=('e0f5229bf881adbe7778464f1fab99162ffc8631537a825074bb360738e8cc54')

package() {
  cd "$srcdir/launcher-v$pkgver"
  # Launcher CLI.
  install -Dm755 cdev "$pkgdir/usr/bin/cdev"
  # OCI network hook + declaration (system hook dir; cdev resolves the same path).
  install -Dm755 container/cdev-net-hook "$pkgdir/usr/lib/cdev/hooks/cdev-net-hook"
  sed 's#@HOOKDIR@#/usr/lib/cdev/hooks#g' container/cdev-net.hook.json \
    > "$pkgdir/usr/lib/cdev/hooks/cdev-net.json"
  # Bootstrap skill (data payload; cdev falls back to this system path).
  install -Dm644 container/skills/cdev-bootstrap/SKILL.md \
    "$pkgdir/usr/share/cdev/skills/cdev-bootstrap/SKILL.md"
  # License.
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
