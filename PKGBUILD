# Maintainer: Branko Simic <branko@simic.ltd>
#
# ═══════════════════════════════════════════════════════════════
# chest-backup — AUR package
# ═══════════════════════════════════════════════════════════════
#
# Before publishing to AUR:
#   1. Create a signed tag:  git tag -s v0.1.0 -m "v0.1.0"
#   2. Push the tag:         git push origin v0.1.0
#   3. Generate .SRCINFO:    makepkg --printsrcinfo > .SRCINFO
#   4. Submit to AUR via     git clone aur@aur.archlinux.org:chest-backup.git
#      the AUR repo (not
#      this source repo)
#
# For local testing without a tag, replace source() with:
#   source=("$pkgname::git+https://github.com/brankosimic/chest-backup.git")
#   sha256sums=('SKIP')
# and the build()/package() functions use $srcdir/$pkgname.

pkgname=chest-backup
pkgver=0.1.0
pkgrel=1
pkgdesc="Full-stack backup manager — web UI, system tray, scheduling, containers, SFTP, local destinations"
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
  'git'
)
optdepends=(
  'docker: container-based backup sources (sqlite-container, postgres-container)'
)
backup=(
  'etc/chest-backup/chest-backup.json'
  'etc/chest-backup/.env'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/brankosimic/chest-backup/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # ── Install all dependencies (including native addons) ──────
  pnpm install

  # ── Build all apps (API, Tray, Web frontend) ────────────────
  pnpm build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # ── Application bundles ─────────────────────────────────────
  # The bun build bundles all JS dependencies inline.
  # Only native addons (cpu-features for ssh2) remain external.

  install -d "$pkgdir/usr/share/$pkgname/packages/api/dist"
  cp packages/api/dist/index.js "$pkgdir/usr/share/$pkgname/packages/api/dist/"

  install -d "$pkgdir/usr/share/$pkgname/packages/tray/dist"
  cp packages/tray/dist/index.js "$pkgdir/usr/share/$pkgname/packages/tray/dist/"
  cp packages/tray/dist/icon_*.png "$pkgdir/usr/share/$pkgname/packages/tray/dist/"

  cp -r packages/web/dist "$pkgdir/usr/share/$pkgname/packages/web/"

  # ── Native addon (cpu-features ─ required by ssh2) ──────────
  # The only external dependency not bundled by bun.
  # pnpm install above already compiled the .node binary.
  CPU_FEATURES="node_modules/.pnpm/cpu-features@*/node_modules/cpu-features"
  # shellcheck disable=SC2086
  if ls $CPU_FEATURES/package.json >/dev/null 2>&1; then
    install -d "$pkgdir/usr/share/$pkgname/node_modules/cpu-features"
    # shellcheck disable=SC2086
    cp -r $CPU_FEATURES/* "$pkgdir/usr/share/$pkgname/node_modules/cpu-features/"
  fi

  # ── Default configuration (editable, preserved on upgrade) ──
  # The JSON ships with empty arrays — the app won't crash, and
  # users add sources/destinations via the web UI.
  # Both files are in backup=() so pacman creates .pacnew on
  # upgrade instead of overwriting user edits.
  install -d "$pkgdir/etc/$pkgname"
  cp chest-backup.default.json "$pkgdir/etc/$pkgname/chest-backup.json"
  cp .env.default "$pkgdir/etc/$pkgname/.env"

  # ── Reference copies for users who want fresh examples ──────
  cp chest-backup.json.example "$pkgdir/usr/share/$pkgname/"
  cp .env.example "$pkgdir/usr/share/$pkgname/"

  # ── Launch script (entry point) ─────────────────────────────
  install -Dm755 bin/chest-backup "$pkgdir/usr/bin/chest-backup"

  # ── Systemd user service ────────────────────────────────────
  install -Dm644 chest-backup.service \
    "$pkgdir/usr/lib/systemd/user/chest-backup.service"

  # ── License ─────────────────────────────────────────────────
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
