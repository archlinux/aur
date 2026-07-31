# Maintainer: Branko Simic <branko@simic.ltd>
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
pkgver=0.1.8
pkgrel=1
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
sha256sums=('a274043b31c36e6486a4559d6e09c1db48965eb5af3a1f8194cf83924bce3b98')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # pnpm 11 blocks dependency build scripts by default, so install
  # without scripts, then compile only the native addons we need.
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

  # Parent dir must exist first, otherwise cp renames dist/ to
  # packages/web/ and the API can't find the UI.
  install -d "$app/packages/web"
  cp -r packages/web/dist "$app/packages/web/"

  # Rewrite bun's baked-in $srcdir paths (dead fallbacks in pino/ssh2)
  # to the install location so makepkg doesn't warn about them.
  sed -i "s|$srcdir/$pkgname-$pkgver|/usr/share/$pkgname|g" \
    "$app/packages/api/dist/index.js" \
    "$app/packages/tray/dist/index.js"

  # Copy pnpm's virtual-store addons (cpu-features, @trayjs) into a
  # flat node_modules so runtime requires resolve. Unmatched globs
  # are skipped by the [ -e ] guard.
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
  install -Dm644 chest-backup.service "$pkgdir/usr/lib/systemd/user/chest-backup.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
  local target_user="" target_home="" chown_flags=() started=false

  if [ -n "$SUDO_USER" ] && [ "$SUDO_USER" != "root" ]; then
    target_user="$SUDO_USER"
    target_home=$(getent passwd "$SUDO_USER" | cut -d: -f6)
    chown_flags=(-o "$SUDO_USER" -g "$SUDO_USER")
  else
    target_home=$(getent passwd "$(id -u)" | cut -d: -f6)
  fi

  cfg_dir="$target_home/.config/chest-backup"

  install -d -m700 "${chown_flags[@]}" "$cfg_dir"
  if [ ! -e "$cfg_dir/chest-backup.json" ]; then
    if [ -e /etc/chest-backup/chest-backup.json ]; then
      install -m600 "${chown_flags[@]}" /etc/chest-backup/chest-backup.json "$cfg_dir/chest-backup.json"
    else
      install -m600 "${chown_flags[@]}" /usr/share/$pkgname/chest-backup.default.json "$cfg_dir/chest-backup.json"
    fi
  fi
  if [ ! -e "$cfg_dir/.env" ]; then
    if [ -e /etc/chest-backup/.env ]; then
      install -m600 "${chown_flags[@]}" /etc/chest-backup/.env "$cfg_dir/.env"
    else
      install -m600 "${chown_flags[@]}" /usr/share/$pkgname/.env.default "$cfg_dir/.env"
    fi
  fi

  if [ -n "$target_user" ]; then
    uid=$(id -u "$target_user")
    if runuser -u "$target_user" -- env XDG_RUNTIME_DIR="/run/user/$uid" \
      systemctl --user daemon-reload && \
      systemctl --user enable --now chest-backup 2>/dev/null; then
      started=true
    else
      install -d "$target_home/.config/systemd/user/default.target.wants"
      ln -sf /usr/lib/systemd/user/chest-backup.service \
        "$target_home/.config/systemd/user/default.target.wants/chest-backup.service"
    fi

    loginctl enable-linger "$target_user" 2>/dev/null || true
  fi

  echo
  if [ "$started" = true ]; then
    echo "  chest-backup installed and running."
  else
    echo "  chest-backup installed. Start it with:"
    echo "      systemctl --user start chest-backup"
  fi
  echo
  echo "  Web UI:              http://localhost:5199"
  echo "  Config:              ~/.config/chest-backup/chest-backup.json"
  echo "  Secrets:             ~/.config/chest-backup/.env"
  echo
}
