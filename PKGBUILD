# Maintainer: Damon Blais <damon.blais@gmail.com>

pkgname=engined
pkgver=0.1.0
pkgrel=1
pkgdesc="Local model door: one OpenAI-shaped endpoint that owns every inference container on the box"
arch=('any')
url="https://github.com/Rethunk-Tech/engined"
license=('MIT')
depends=('bun')
makedepends=('git')
optdepends=(
  'docker: run the inference engines and the Cursor TLS bridge'
  'bubblewrap: read-only sandbox for the opencode engine'
)
install=engined.install
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('7afbea4408001728f0d2fa24b89ed3ce8cadb95c542163c95bf5f9f252116b84')

build() {
  cd "$pkgname"
  # The bundle has no runtime dependencies, so no `bun install` is needed.
  ENGINED_COMMIT=$(git rev-parse HEAD) bun run build
}

package() {
  cd "$pkgname"
  install -Dm0644 dist/main.js "$pkgdir/usr/lib/engined/main.js"
  install -Dm0644 deploy/Caddyfile.cursor "$pkgdir/usr/lib/engined/Caddyfile.cursor"
  cp -r --no-preserve=ownership engines "$pkgdir/usr/lib/engined/engines"

  # install.sh's own renderer, so the packaged units cannot drift from the
  # templates; only the paths differ. %S is the user's state directory.
  (
    source scripts/install.sh
    resolve_paths
    BUN_PATH=/usr/bin/bun BUNX_PATH=/usr/bin/bunx DOCKER_PATH=/usr/bin/docker
    UNIT_INSTALL_DIR=/usr/lib/engined UNIT_STATE_DIR=%S/engined
    install -d "$pkgdir/usr/lib/systemd/user"
    for unit in engined.service engined-probe.service engined-probe.timer engined-tls.service; do
      render_unit_file "$unit.in" "$pkgdir/usr/lib/systemd/user/$unit"
    done
  )

  # Not under /usr/share/doc, which NoExtract commonly strips: the install
  # message tells every user to copy it.
  install -Dm0644 config.example.toml "$pkgdir/usr/share/engined/config.example.toml"
  install -Dm0644 HUMANS.md "$pkgdir/usr/share/doc/engined/HUMANS.md"
  cp -r --no-preserve=ownership docs/. "$pkgdir/usr/share/doc/engined/"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/engined/LICENSE"
  install -Dm0644 THIRD_PARTY_NOTICES.md "$pkgdir/usr/share/licenses/engined/THIRD_PARTY_NOTICES.md"
}
