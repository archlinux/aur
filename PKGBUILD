# Maintainer: Thomas <thomas.sigmund1989@gmail.com>
pkgname=gaming-command-center
pkgver=0.1.5
pkgrel=1
pkgdesc="Linux gaming optimisation — CPU CCD parking, NVIDIA GPU overclocking, one-click game fixes and a system doctor"
arch=('any')
url="https://github.com/LordHayne/GCC"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'libadwaita'
  'python-yaml'
  'polkit'
)
optdepends=(
  'lm_sensors: CPU temperature readout on the dashboard'
  'nvidia-utils: NVIDIA GPU overclocking and live monitoring (nvidia-settings)'
  'gamemode: Feral GameMode integration'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/LordHayne/GCC/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('51f003b2c1181e706cc64f8102b01cc1030543e08cedb10f7b43ed1448cd2223')

_srcdir="GCC-$pkgver"

prepare() {
  cd "$_srcdir"
  # A pacman package owns /usr, not /usr/local. The upstream source hardcodes its
  # two privileged helpers under /usr/local/bin (correct for its curl|bash
  # installer, forbidden for an AUR package). Relocate them to /usr/bin and patch
  # every reference in lockstep — the app's path constants AND the polkit policy's
  # exec-path annotations — so the no-password Game-Mode action keeps resolving.
  sed -i \
    -e 's|/usr/local/bin/gaming-ccd-helper|/usr/bin/gaming-ccd-helper|g' \
    -e 's|/usr/local/bin/gaming-cc-etc-helper|/usr/bin/gaming-cc-etc-helper|g' \
    command-center.py com.gaming.commandcenter.policy
}

package() {
  cd "$_srcdir"

  # 1. App code + data → /usr/share (arch-independent Python). command-center.py
  #    resolves its assets relative to its own dir, so games.yaml and the logo
  #    must sit beside it.
  install -d "$pkgdir/usr/share/$pkgname"
  install -m644 -t "$pkgdir/usr/share/$pkgname" \
    command-center.py \
    system_scanner.py \
    topology.py \
    game_db.py \
    steam_scanner.py \
    app_update.py \
    report_stats.py \
    distro.py \
    games.yaml \
    GCC_logo.png

  # 2. Privileged helpers → /usr/bin (matched by the patched polkit policy above).
  install -Dm755 gaming-ccd-helper    "$pkgdir/usr/bin/gaming-ccd-helper"
  install -Dm755 gaming-cc-etc-helper "$pkgdir/usr/bin/gaming-cc-etc-helper"

  # 3. Polkit policy — must be world-readable (0644) or polkit ignores the action.
  install -Dm644 com.gaming.commandcenter.policy \
    "$pkgdir/usr/share/polkit-1/actions/com.gaming.commandcenter.policy"

  # 4. Desktop launcher — the basename MUST equal the Adw application_id
  #    (com.gaming.commandcenter) or Wayland compositors can't map the window to
  #    its icon and the taskbar entry goes blank. StartupWMClass covers X11.
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/com.gaming.commandcenter.desktop" <<'DESKTOP'
[Desktop Entry]
Name=Gaming Command Center
Comment=Linux gaming optimisation — CPU CCD parking, GPU overclocking, system setup wizard
Exec=gaming-command-center
Icon=gaming-command-center
Terminal=false
Type=Application
StartupWMClass=com.gaming.commandcenter
Categories=Game;System;Utility;
Keywords=gaming;ryzen;cpu;gpu;nvidia;overclock;ccd;gamemode;linux;
DESKTOP

  # 5. Icon into the hicolor theme. One PNG source installed at every size the
  #    upstream setup uses, plus scalable, so every panel/taskbar size resolves.
  local size
  for size in 48 64 128 256 512; do
    install -Dm644 GCC_logo.png \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/gaming-command-center.png"
  done
  install -Dm644 GCC_logo.png \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/gaming-command-center.png"

  # 6. Launcher shim on PATH. The .desktop Exec and users both call this.
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<'LAUNCH'
#!/bin/sh
exec python3 /usr/share/gaming-command-center/command-center.py "$@"
LAUNCH
}
