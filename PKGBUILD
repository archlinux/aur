# Maintainer: Branko Simic <branko@simic.ltd>
#
# ═══════════════════════════════════════════════════════════════
# chest-backup — AUR package
# ═══════════════════════════════════════════════════════════════
#
# Before publishing to AUR:
#   1. Create a signed tag:  git tag -s v0.1.5 -m "v0.1.5"
#   2. Push the tag:         git push origin v0.1.5
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
pkgver=0.1.5
pkgrel=1
pkgdesc="Full-stack backup manager — web UI, system tray, scheduling, containers, SFTP, local destinations"
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

  # pnpm 11 blocks dependency build scripts by default.
  # Install first without scripts, then rebuild only the native addons.
  pnpm install --frozen-lockfile --ignore-scripts
  pnpm rebuild cpu-features esbuild ssh2

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
  # External dependencies not bundled by bun ship as-is; @trayjs/* is
  # handled in the block below.
  # pnpm install above already compiled the .node binary.
  CPU_FEATURES="node_modules/.pnpm/cpu-features@*/node_modules/cpu-features"
  # shellcheck disable=SC2086
  if ls $CPU_FEATURES/package.json >/dev/null 2>&1; then
    install -d "$pkgdir/usr/share/$pkgname/node_modules/cpu-features"
    # shellcheck disable=SC2086
    cp -r $CPU_FEATURES/* "$pkgdir/usr/share/$pkgname/node_modules/cpu-features/"
  fi

  # ── System tray native code (@trayjs) ────────────────────────
  # The tray bundle imports @trayjs at runtime instead of bundling it
  # (a compiled binary can't be inlined into JS), so the wrapper and
  # the platform binary must exist in node_modules after install.
  # pnpm only installed the binary for this CPU (x64 or arm64);
  # copy whatever is present.
  TRAYJS="node_modules/.pnpm/@trayjs+*/node_modules/@trayjs"
  # shellcheck disable=SC2086
  if ls $TRAYJS/*/package.json >/dev/null 2>&1; then
    install -d "$pkgdir/usr/share/$pkgname/node_modules/@trayjs"
    # shellcheck disable=SC2086
    for dir in $TRAYJS/*; do
      [ -e "$dir" ] || continue
      name=$(basename "$dir")
      [ -e "$pkgdir/usr/share/$pkgname/node_modules/@trayjs/$name" ] && continue
      cp -r "$dir" "$pkgdir/usr/share/$pkgname/node_modules/@trayjs/"
    done
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

post_install() {
  if [ -n "$SUDO_USER" ] && [ "$SUDO_USER" != "root" ]; then
    uid=$(id -u "$SUDO_USER")
    user_home=$(getent passwd "$SUDO_USER" | cut -d: -f6)

    if runuser -u "$SUDO_USER" -- env XDG_RUNTIME_DIR="/run/user/$uid" \
      systemctl --user enable --now chest-backup 2>/dev/null; then
      started=true
    else
      install -d "$user_home/.config/systemd/user/default.target.wants"
      ln -sf /usr/lib/systemd/user/chest-backup.service \
        "$user_home/.config/systemd/user/default.target.wants/chest-backup.service"
      started=false
    fi

    # Boot-time start without login so scheduled backups always run.
    loginctl enable-linger "$SUDO_USER" 2>/dev/null || true

    echo
    if [ "$started" = true ]; then
      echo "  █ chest-backup installed and running."
    else
      echo "  █ chest-backup installed. Start it with:"
      echo "      systemctl --user start chest-backup"
    fi
  else
    echo
    echo "  █ chest-backup installed. Start it with:"
    echo "      systemctl --user enable --now chest-backup"
  fi
  echo
  echo "  Web UI:              http://localhost:5199"
  echo
}
