pkgname=pbwrap
pkgver=0.1.0
pkgrel=2
pkgdesc="PocketBase instance manager"
arch=('x86_64' 'aarch64')
depends=('bash' 'curl' 'unzip' 'jq' 'rsync' 'systemd')
license=('GPL3')
install=pbwrap.install
source=("https://github.com/Arcodify/pbwrap/archive/refs/tags/v${pkgver}.tar.gz"
        "pbwrap.install")
sha256sums=('SKIP'
            'SKIP')

build() {
  : # no build step
}

package() {
  local srcdir_repo="$srcdir/${pkgname}-${pkgver}"

  install -d "$pkgdir/opt/pbwrap" "$pkgdir/etc/pbwrap/instances.d" "$pkgdir/opt/pb_apps" "$pkgdir/usr/bin" "$pkgdir/usr/lib/systemd/system"

  # Copy repo, exclude git metadata
  rsync -a --delete --exclude '.git' "$srcdir_repo/" "$pkgdir/opt/pbwrap/"

  # Ensure versions.json exists
  if [[ ! -f "$pkgdir/opt/pbwrap/config/versions.json" && -f "$pkgdir/opt/pbwrap/config/versions.default.json" ]]; then
    cp "$pkgdir/opt/pbwrap/config/versions.default.json" "$pkgdir/opt/pbwrap/config/versions.json"
  fi

  # Systemd unit (package-managed; pbwrap install-systemd still works for /etc/)
  cat >"$pkgdir/usr/lib/systemd/system/pocketbase@.service" <<'UNITEOF'
[Unit]
Description=PocketBase instance (%i)
After=network.target

[Service]
Type=simple
User=%i
Group=%i
WorkingDirectory=/opt/pb_apps/%i
EnvironmentFile=/etc/pbwrap/instances.d/%i.env
ExecStart=/opt/pb_apps/%i/pocketbase serve --http=${PB_BIND}:${PB_PORT} --dir=/opt/pb_apps/%i/pb_data
Restart=on-failure
RestartSec=2

NoNewPrivileges=true
PrivateTmp=true
ProtectSystem=strict
ProtectHome=true
ReadWritePaths=/opt/pb_apps/%i

[Install]
WantedBy=multi-user.target
UNITEOF

  chmod 0644 "$pkgdir/usr/lib/systemd/system/pocketbase@.service"

  # Wrapper entrypoint to avoid symlink resolution issues
  cat >"$pkgdir/usr/bin/pbwrap" <<'WRAPPER'
#!/usr/bin/env bash
exec /opt/pbwrap/pbwrap.sh "$@"
WRAPPER
  chmod +x "$pkgdir/usr/bin/pbwrap"
}
