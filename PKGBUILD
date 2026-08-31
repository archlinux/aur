# Maintainer: Atmosphera App <atmosphera-app@proton.me>

pkgname=atmosphera
pkgver=0.6.2
pkgrel=1
pkgdesc="Atmosphera - a customizable desktop shell for Niri and Hyprland, built with Quickshell"
arch=('any')
url="https://github.com/alexindigo/atmosphera"
license=('GPL-3.0-or-later')
makedepends=()
depends=(
  'quickshell'
  'qt6-dbusqml>=0.8.0'
  'qt6-pipewirespectrum'
  'qt6-xdgiconqml-git'
  'imagemagick'
  'brightnessctl'
  'ffmpeg'
  'qt6-multimedia'
  'python'
  'python-dbus'
  'python-gobject'
  'wlr-randr'
)
optdepends=(
  'cliphist: For clipboard history support'
  'wlsunset: For supporting NightLight'
  'power-profiles-daemon: For power profile management'
  'ddcutil: For external display brightness control'
  'qt6-niriqml: niri IPC integration (workspaces, windows, session config)'
  'qt6-mangowcqml: mangowc IPC integration (workspaces, windows, session config)'
  'keyd: hardware-level keyboard remapping (bindings environments)'
  'xremap-niri-bin: session-level app-scoped keymaps (macos bindings)'
  'qt6-5compat: required by some registry plugins (e.g. cookie-clock)'
  'qt6-websockets: required by some registry plugins (e.g. hassio)'
  'xdg-desktop-portal-gnome: screencast / screen-sharing support (niri cannot use -wlr)'
)
provides=('atmosphera' 'xdg-desktop-portal-impl')
conflicts=('atmosphera-git')
install=atmosphera.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('55dae7c086d9f8729befad48c891a38e38db58d1cfe5e45cea62bf3b731f22b2')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/etc/xdg/quickshell/atmosphera"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/atmosphera/"
  # Exclude dev tooling and temp files from the installed tree
  rm -rf "$pkgdir/etc/xdg/quickshell/atmosphera/dev"
  rm -rf "$pkgdir/etc/xdg/quickshell/atmosphera/tmp"

  # Bake the packaged version for the shell's version detection
  echo "$pkgver" > "$pkgdir/etc/xdg/quickshell/atmosphera/VERSION"

  # Install dispatcher to PATH (handlers resolved via SELF_DIR auto-detect)
  install -Dm755 Scripts/bash/atmosphera "$pkgdir/usr/local/bin/atmosphera"
  # Multi-call symlinks: invoke as atmosphera-session etc. for backward compat
  ln -sf atmosphera "$pkgdir/usr/local/bin/atmosphera-session"
  ln -sf atmosphera "$pkgdir/usr/local/bin/atmosphera-settings"
  ln -sf atmosphera "$pkgdir/usr/local/bin/atmosphera-lock"

  # xdg-desktop-portal backend manifest + niri backend preference. The
  # preference lives in /etc/xdg so it wins over niri's own
  # /usr/share/xdg-desktop-portal/niri-portals.conf (default=gnome;gtk;)
  # without owning the same path.
  install -Dm644 Portals/atmosphera.portal "$pkgdir/usr/share/xdg-desktop-portal/portals/atmosphera.portal"
  install -Dm644 Portals/niri-portals.conf "$pkgdir/etc/xdg/xdg-desktop-portal/niri-portals.conf"

  # keyd reload service (triggered via systemd D-Bus StartUnit by the shell)
  install -Dm644 Scripts/systemd/atmosphera-keyd-reload.service "$pkgdir/usr/lib/systemd/system/atmosphera-keyd-reload.service"
  # xremap user unit (env-gated by the shell via the user manager)
  install -Dm644 Scripts/systemd/xremap-atmosphera.service "$pkgdir/usr/lib/systemd/user/xremap-atmosphera.service"
  # uinput access for the input group (xremap's virtual keyboard output)
  install -Dm644 Scripts/udev/80-atmosphera-uinput.rules "$pkgdir/usr/lib/udev/rules.d/80-atmosphera-uinput.rules"
  # polkit: allow active sessions/wheel to start that one service, no prompt
  install -Dm644 Scripts/polkit/atmosphera-keyd.rules "$pkgdir/usr/share/polkit-1/rules.d/atmosphera-keyd.rules"

  # app.atmosphera.HwController — D-Bus-faced privileged helper (turbo toggle)
  install -Dm755 Scripts/python/hw-controller.py "$pkgdir/usr/lib/atmosphera/hw-controller"
  install -Dm644 Scripts/systemd/app.atmosphera.HwController.service "$pkgdir/usr/lib/systemd/system/app.atmosphera.HwController.service"
  install -Dm644 Scripts/dbus/app.atmosphera.HwController.service "$pkgdir/usr/share/dbus-1/system-services/app.atmosphera.HwController.service"
  install -Dm644 Scripts/dbus/app.atmosphera.HwController.conf "$pkgdir/etc/dbus-1/system.d/app.atmosphera.HwController.conf"
  install -Dm644 Scripts/polkit/app.atmosphera.hwcontroller.policy "$pkgdir/usr/share/polkit-1/actions/app.atmosphera.hwcontroller.policy"

  # Supervised shell as a systemd user service (DMS pattern); activated per
  # compositor via `atmosphera setup <wm>` (add-wants), never force-enabled.
  install -Dm644 Scripts/systemd/atmosphera.service "$pkgdir/usr/lib/systemd/user/atmosphera.service"
  install -Dm644 Scripts/systemd/hyprland-session.target "$pkgdir/usr/lib/systemd/user/hyprland-session.target"
}
