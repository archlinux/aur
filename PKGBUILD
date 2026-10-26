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
pkgver=1.0.0
pkgrel=1
install=chest-backup.install
pkgdesc="Full-stack backup manager with web UI and scheduling"
arch=('x86_64' 'aarch64')
url="https://github.com/brankosimic/chest-backup"
license=('MIT')
depends=(
  'bun'
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
sha256sums=('d5fd63104e5cd85026c678923049b82669ca461167da878a3de69fe3a1ec66be')

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

  install -d "$app/packages/web"
  cp -r packages/web/dist "$app/packages/web/"

  sed -i "s|$srcdir/$pkgname-$pkgver|/usr/share/$pkgname|g" \
    "$app/packages/api/dist/index.js"

  for src in \
    node_modules/.pnpm/cpu-features@*/node_modules/cpu-features; do
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
  install -Dm644 chest-backup.service "$pkgdir/usr/lib/systemd/user/chest-backup.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
