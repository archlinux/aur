# Maintainer: Atmosphera App <atmosphera-app@proton.me>

_gitname=atmosphera

pkgname=atmosphera-git
pkgver=0.1.0.r0.g0000000
pkgrel=4
install=atmosphera-git.install
pkgdesc="Atmosphera - a customizable desktop shell for Niri and Hyprland, built with Quickshell (git version)"
arch=('any')
url="https://github.com/alexindigo/atmosphera"
license=('GPL-3.0-or-later')
makedepends=('git')
depends=(
  'noctalia-qs'
  'qt6-dbusqml'
  'qt6-xdgiconqml-git'
  'imagemagick'
  'brightnessctl'
  'ffmpeg'
  'qt6-multimedia'
  'python'
  'wlr-randr'
)
optdepends=(
  'cliphist: For clipboard history support'
  'wlsunset: For supporting NightLight'
  'power-profiles-daemon: For power profile management'
  'ddcutil: For external display brightness control'
  'qt6-niriqml: niri IPC integration (workspaces, windows, session config)'
  'keyd: hardware-level keyboard remapping (bindings environments)'
  'xremap-niri-bin: session-level app-scoped keymaps (macos bindings)'
)
provides=('atmosphera')
conflicts=('atmosphera')
source=("git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
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

  # keyd reload service (triggered via systemd D-Bus StartUnit by the shell)
  install -Dm644 Scripts/systemd/atmosphera-keyd-reload.service "$pkgdir/usr/lib/systemd/system/atmosphera-keyd-reload.service"
  # xremap user unit (env-gated by the shell via the user manager)
  install -Dm644 Scripts/systemd/xremap-atmosphera.service "$pkgdir/usr/lib/systemd/user/xremap-atmosphera.service"
  # uinput access for the input group (xremap's virtual keyboard output)
  install -Dm644 Scripts/udev/80-atmosphera-uinput.rules "$pkgdir/usr/lib/udev/rules.d/80-atmosphera-uinput.rules"
  # polkit: allow active sessions/wheel to start that one service, no prompt
  install -Dm644 Scripts/polkit/atmosphera-keyd.rules "$pkgdir/usr/share/polkit-1/rules.d/atmosphera-keyd.rules"
}
