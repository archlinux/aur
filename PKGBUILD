# Maintainer: Tamim <you@example.com>
pkgname=eternal-timer
pkgver=3.0.0
pkgrel=1
pkgdesc="Timers and stopwatches that survive shutdowns and power cuts"
arch=('any')
url="https://github.com/Tamim180/eternal-timer"
license=('MIT')
depends=('python' 'pyside6')
optdepends=(
    'python-cryptography: encrypted phone sync'
    'libnotify: desktop notifications while the window is closed'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Tamim180/eternal-timer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('23551868df7cafac6d3976beae5dc3d74b4a6d99c4cf80217179ea7005def74e')
install=eternal-timer.install

package() {
  cd "$pkgname-$pkgver"

  # --- the app itself, as a flat module directory ---
  install -Dm644 eternal_timer_core.py "$pkgdir/usr/lib/$pkgname/eternal_timer_core.py"
  install -Dm644 eternal_timer_sync.py "$pkgdir/usr/lib/$pkgname/eternal_timer_sync.py"
  install -Dm755 eternal_timer_gui.py  "$pkgdir/usr/lib/$pkgname/eternal_timer_gui.py"
  install -Dm755 etimer                "$pkgdir/usr/lib/$pkgname/etimer"

  # --- thin launchers on PATH ---
  # Running "python3 /usr/lib/eternal-timer/<file>" puts that directory on
  # sys.path automatically, so the sibling "import eternal_timer_core"
  # inside etimer/eternal_timer_gui.py just works with no PYTHONPATH games.
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/eternal-timer" <<'EOF'
#!/bin/sh
exec python3 /usr/lib/eternal-timer/eternal_timer_gui.py "$@"
EOF

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/etimer" <<'EOF'
#!/bin/sh
exec python3 /usr/lib/eternal-timer/etimer "$@"
EOF

  # --- desktop entry + icon ---
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/eternal-timer.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Eternal Timer
Comment=Multi-timer and stopwatch that survives shutdowns
Exec=eternal-timer
Icon=eternal-timer
Terminal=false
Categories=Utility;
EOF

  install -Dm644 flatpak/icon-128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/eternal-timer.png"
  install -Dm644 flatpak/icon-256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/eternal-timer.png"

  # --- catch a finished countdown at login, even after a power cut ---
  # Vendored to /etc/xdg/autostart (not ~/.config/autostart) so it applies
  # system-wide without touching any user's home directory during install.
  install -Dm644 /dev/stdin "$pkgdir/etc/xdg/autostart/eternal-timer-check.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Eternal Timer check
Comment=Checks for finished timers at login and notifies
Exec=etimer check
Terminal=false
X-GNOME-Autostart-enabled=true
NoDisplay=true
EOF

  # --- optional systemd --user units: re-check every 60s while logged in ---
  # Vendored units go in /usr/lib/systemd/user/, not /etc -- enabling them
  # per-user is a login-session action a package install can't safely do,
  # so that's left to the user (see eternal-timer.install).
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/eternal-timer-check.service" <<'EOF'
[Unit]
Description=Eternal Timer finish check

[Service]
Type=oneshot
ExecStart=/usr/bin/etimer check
EOF

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/eternal-timer-check.timer" <<'EOF'
[Unit]
Description=Run Eternal Timer check every minute

[Timer]
OnBootSec=30s
OnUnitActiveSec=60s
Persistent=true

[Install]
WantedBy=timers.target
EOF

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
