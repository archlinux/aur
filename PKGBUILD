# Maintainer: Damon Blais <damon.blais@gmail.com>

pkgname=engined
pkgver=0.2.13
pkgrel=1
pkgdesc="Local model door: one OpenAI-shaped endpoint that owns every inference container on the box"
arch=('any')
# Nothing here is a binary, so strip and the debug split have nothing to do, and
# running them only invites fakeroot noise from the host's toolchain.
options=('!strip' '!debug')
url="https://github.com/Rethunk-Tech/engined"
license=('MIT')
depends=('bun')
optdepends=(
  'docker: run the inference engines and the Cursor TLS bridge'
  'bubblewrap: read-only sandbox for the opencode engine'
)
install=engined.install
# The release workflow builds this tarball once; nothing is built here.
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('bfe0ed7efaa318c2d9e882bafc2e0ee918b97a2620d1ebda004c0421d544adb2')

package() {
  cd "$pkgname-$pkgver"
  # main.js and the config UI's assets beside it, which it finds by relative path.
  install -d "$pkgdir/usr/lib/engined"
  cp -r --no-preserve=ownership dist/. "$pkgdir/usr/lib/engined/"
  install -Dm0644 deploy/Caddyfile.cursor "$pkgdir/usr/lib/engined/Caddyfile.cursor"
  cp -r --no-preserve=ownership engines "$pkgdir/usr/lib/engined/engines"

  # The CLI modes (--configsvc-url, --doctor, --hash-password) the install
  # message names run through this.
  install -Dm0755 /dev/stdin "$pkgdir/usr/bin/engined" <<'LAUNCHER'
#!/bin/sh
exec /usr/bin/bun /usr/lib/engined/main.js "$@"
LAUNCHER

  # install.sh's own renderer, so the packaged units cannot drift from the
  # templates; only the paths differ. %S is the user's state directory.
  (
    source scripts/install.sh
    resolve_paths
    BUN_PATH=/usr/bin/bun BUNX_PATH=/usr/bin/bunx DOCKER_PATH=/usr/bin/docker
    UNIT_INSTALL_DIR=/usr/lib/engined UNIT_STATE_DIR=%S/engined UNIT_CONFIG_DIR=%h/.config/engined
    install -d "$pkgdir/usr/lib/systemd/user"
    for unit in engined.service engined-configsvc.service engined-probe.service engined-probe.timer engined-tls.service; do
      render_unit_file "$unit.in" "$pkgdir/usr/lib/systemd/user/$unit"
    done
  )

  # Not under /usr/share/doc, which NoExtract commonly strips: the install
  # message tells every user to copy it.
  install -Dm0644 config.example.toml "$pkgdir/usr/share/engined/config.example.toml"
  install -Dm0644 config.schema.json "$pkgdir/usr/share/engined/config.schema.json"
  install -Dm0644 HUMANS.md "$pkgdir/usr/share/doc/engined/HUMANS.md"
  cp -r --no-preserve=ownership docs/. "$pkgdir/usr/share/doc/engined/"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/engined/LICENSE"
  install -Dm0644 THIRD_PARTY_NOTICES.md "$pkgdir/usr/share/licenses/engined/THIRD_PARTY_NOTICES.md"
}
