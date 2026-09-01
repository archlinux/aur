# Maintainer: Teez <dmedoro13@gmail.com>
pkgname=crux-shell-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="A personal QuickShell desktop shell for Hyprland"
arch=('any')
url="https://github.com/teezlabs/crux-shell"
license=('custom')
depends=(
  'quickshell'
  'matugen'
  'brightnessctl'
  'wlsunset'
  'cliphist'
  'wl-clipboard'
  'playerctl'
  'networkmanager'
  'bluez'
  'python'
  'git'
)
optdepends=(
  'grim: settings-panel/verification screenshots'
  'lm_sensors: CPU temperature in Control Center'
  'wf-recorder: Control Center RECORD action tile'
  'hyprpicker: Control Center COLOR action tile'
  'kitty: themed by the wallpaper-driven color pipeline'
  'gtk3: themed by the wallpaper-driven color pipeline'
  'gtk4: themed by the wallpaper-driven color pipeline'
  'qt6ct: themed by the wallpaper-driven color pipeline'
  'yazi: themed by the wallpaper-driven color pipeline'
  'btop: themed by the wallpaper-driven color pipeline'
  'starship: themed by the wallpaper-driven color pipeline'
  'vesktop: themed by the wallpaper-driven color pipeline'
  'sddm: crux ships a matching SDDM login theme (not installed by this package — see the crux repos SKILL.md/notes.md for the manual system-wide setup)'
  'sudo: passwordless DNS-provider switching in the Wifi popup (falls back to a polkit prompt every time without it)'
)
provides=('crux-shell')
conflicts=('crux-shell')
backup=('etc/sudoers.d/crux-dns')
source=("$pkgname::git+https://github.com/teezlabs/crux-shell.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  # Quickshell resolves a named config as
  # <xdg config dir>/quickshell/<name>/shell.qml — installing under
  # /etc/xdg/quickshell/crux makes `qs -c crux` work for every user on
  # the system, not just whoever built the package.
  local dest="$pkgdir/etc/xdg/quickshell/crux"
  install -dm755 "$dest"

  cp -r shell.qml Commons Modules Assets bin "$dest/"

  # bin/ holds a couple of Python/bash helper scripts crux shells out to
  # (matugen post-hooks, wallpaper-picker glue) — keep them executable.
  find "$dest/bin" -maxdepth 1 -type f -exec chmod 755 {} \;

  # crux-dns needs to be a bare command on $PATH (WifiPanelContent.qml
  # shells out to it by name, not by Quickshell.shellDir), and its own
  # sudoers rule below is pinned to this exact path — so it's installed
  # to /usr/bin instead of living only under the config dir above.
  rm -f "$dest/bin/crux-dns"
  install -Dm755 bin/crux-dns "$pkgdir/usr/bin/crux-dns"
  install -Dm440 packaging/crux-dns.sudoers "$pkgdir/etc/sudoers.d/crux-dns"
}
