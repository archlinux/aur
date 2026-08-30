# Maintainer: Atmosphera App <atmosphera-app@proton.me>

_gitname=atmosphera

pkgname=atmosphera-git
_release_ver=0.6.0.r0
pkgver=0.6.0.r0.g0000000
pkgrel=9
install=atmosphera-git.install
pkgdesc="Atmosphera - a customizable desktop shell for Niri and Hyprland, built with Quickshell (git version)"
arch=('any')
url="https://github.com/alexindigo/atmosphera"
license=('GPL-3.0-or-later')
makedepends=('git')
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
conflicts=('atmosphera')
source=("git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    # NOTE: capture describe output explicitly — `git describe ... | sed ...`
    # masks describe's exit code (sed exits 0 on empty input), so a pipeline
    # `|| echo fallback` never fires on tagless/partial clones.
    local out
    out=$(git describe --long --tags 2>/dev/null) || out=""
    if [ -n "$out" ]; then
        printf "%s" "$out" | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
    else
        echo "${_release_ver}.g$(git rev-parse --short HEAD)"
    fi
}

package() {
  cd "$srcdir/$_gitname"

  install -dm755 "$pkgdir/etc/xdg/quickshell/atmosphera"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/atmosphera/"
  # Bake the real package version into the installed tree (About panel reads it)
  echo "$pkgver" > "$pkgdir/etc/xdg/quickshell/atmosphera/VERSION"
  # Exclude dev tooling and temp files from the installed tree
  rm -rf "$pkgdir/etc/xdg/quickshell/atmosphera/dev"
  rm -rf "$pkgdir/etc/xdg/quickshell/atmosphera/tmp"

  # Install dispatcher to PATH (handlers resolved via SELF_DIR auto-detect)
  install -Dm755 Scripts/bash/atmosphera "$pkgdir/usr/local/bin/atmosphera"
  # Multi-call symlinks: invoke as atmoshera-session etc. for backward compat
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
}
