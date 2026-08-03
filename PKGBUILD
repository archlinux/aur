# Maintainer: Branko Simic <branko@valens.dev>
#
# Publishing:
#   1. git tag -s v$pkgver -m "v$pkgver" && git push origin v$pkgver
#   2. makepkg --printsrcinfo > .SRCINFO
#   3. Commit PKGBUILD + .SRCINFO to the AUR repo
#
# Local testing without a tag:
#   source=("$pkgname::git+https://github.com/brankosimic/chest-backup.git")
#   sha256sums=('SKIP')

pkgname=chest-backup
pkgver=0.2.0
pkgrel=1
install=chest-backup.install
pkgdesc="Full-stack backup manager with web UI, system tray and scheduling"
arch=('x86_64' 'aarch64')
url="https://github.com/brankosimic/chest-backup"
license=('MIT')
depends=(
  'bun'
  'libayatana-appindicator'
)
makedepends=(
  'nodejs'
  'pnpm'
  'python'
)
optdepends=(
  'docker: container-based backup sources (sqlite-container, postgres-container)'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/brankosimic/chest-backup/archive/v$pkgver.tar.gz")
sha256sums=('751b12b0c599a64bf7d6928e944902f39b90ec0cd60635ddd117ba14025efa11')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  pnpm install --frozen-lockfile --ignore-scripts
  pnpm rebuild cpu-features esbuild ssh2
  pnpm build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  local app="$pkgdir/usr/share/$pkgname"

  install -Dm644 packages/api/dist/index.js "$app/packages/api/dist/index.js"
  install -Dm644 packages/tray/dist/index.js "$app/packages/tray/dist/index.js"
  install -Dm644 packages/tray/dist/icon_*.png "$app/packages/tray/dist/"

  install -d "$app/packages/web"
  cp -r packages/web/dist "$app/packages/web/"

  sed -i "s|$srcdir/$pkgname-$pkgver|/usr/share/$pkgname|g" \
    "$app/packages/api/dist/index.js" \
    "$app/packages/tray/dist/index.js"

  for src in \
    node_modules/.pnpm/cpu-features@*/node_modules/cpu-features \
    node_modules/.pnpm/@trayjs+*/node_modules/@trayjs/*; do
    [ -e "$src" ] || continue
    rel="${src#node_modules/.pnpm/*/node_modules/}"
    install -d "$app/node_modules/$(dirname "$rel")"
    cp -r "$src" "$app/node_modules/$rel"
  done

  install -Dm644 chest-backup.default.json "$app/chest-backup.default.json"
  install -Dm644 .env.default "$app/.env.default"
  install -Dm644 chest-backup.json.example "$app/chest-backup.json.example"
  install -Dm644 .env.example "$app/.env.example"
  install -Dm755 bin/chest-backup "$pkgdir/usr/bin/chest-backup"
  install -Dm644 chest-backup.service "$pkgdir/usr/lib/systemd/user/chest-backup-tray.service"
  install -Dm644 chest-backup-headless.service "$pkgdir/usr/lib/systemd/user/chest-backup-headless.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
