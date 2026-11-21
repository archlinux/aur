# Maintainer: ZaViBiS <igordnepr27@gmail.com>

pkgname=kolir-git
pkgver=r160.dbe9741
pkgrel=1
pkgdesc='Material 3 desktop configuration for Hyprland and Quickshell'
arch=('any')
url='https://github.com/rormic/kolir'
license=('GPL-3.0-or-later')
depends=(
  'hyprland>=0.57.2'
  'quickshell>=0.3.2'
  'hyprsunset'
  'hyprlock'
  'hypridle'
  'foot'
  'matugen'
  'awww'
  'brightnessctl'
  'ddcutil'
  'playerctl'
  'pipewire'
  'pipewire-pulse'
  'wireplumber'
  'wl-clipboard'
  'grim'
  'slurp'
  'wf-recorder'
  'libnotify'
  'glib2'
  'python'
  'zsh'
  'ttf-material-symbols-variable'
  'ttf-googlesanscode-nerd'
  'ttf-dejavu'
  'ttf-dejavu-nerd'
  'papirus-icon-theme'
  'hicolor-icon-theme'
)
makedepends=('git')
optdepends=(
  'cliphist: clipboard history mode in the launcher'
  'ffmpeg: lock-screen background rendering and recording encoder probing'
  'networkmanager: Internet settings page (nmcli)'
  'bluez: Bluetooth settings page'
  'bluez-utils: Bluetooth settings page (bluetoothctl)'
  'hyprpicker: colour picker keybind'
  'wl-screenrec: fallback screen recorder when wf-recorder is unavailable'
  'zenity: wallpaper picker dialog'
  'nautilus: file manager keybind'
  'kdeconnect: kdeconnect-indicator autostart entry'
  'mocu-xcursor: cursor theme used by the example user.lua'
  'kconfig: kwriteconfig6, updates the KDE colour scheme from the bar theme toggle'
  'xdg-desktop-portal-hyprland: screen sharing portal for browsers and apps'
)
# AUR-only tools stay out of the hard dependency list: wl-screenrec is only an
# optdepend above, and mocu-xcursor (cursor theme referenced by
# config/hypr/user.lua.example) is documented in README.md instead.
provides=('kolir')
conflicts=('kolir')
install=kolir.install
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/kolir"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/kolir"

  # Runtime configuration tree: /usr/share/kolir/config
  # A fresh VCS checkout only contains tracked files, so machine-local artifacts
  # (.qmlls.ini, generated colour files) never reach this directory.
  install -d "$pkgdir/usr/share/kolir"
  cp -a --no-preserve=ownership config "$pkgdir/usr/share/kolir/"
  rm -f "$pkgdir/usr/share/kolir/config/quickshell/.qmlls.ini"

  # Executable entry point (repository mode is 0644, the package makes it 0755)
  # TODO(phase 2): confirm the final CLI entry point with the `kolir` agent.
  install -Dm755 tools/kolir.py "$pkgdir/usr/bin/kolir"

  # Shell profile pieces, consumed by `kolir setup` rather than sourced from /usr
  install -Dm644 zshrc "$pkgdir/usr/share/kolir/zshrc"
  install -Dm644 dice.zsh-theme "$pkgdir/usr/share/kolir/dice.zsh-theme"

  # Licence and version marker
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/kolir/LICENSE"
  printf '%s\n' "$pkgver" >"$pkgdir/usr/share/kolir/.version"

  # Auto-reload units are rendered per user by `kolir setup --auto-reload`
  # into ~/.config/systemd/user, using /usr/bin/kolir when the checkout copy
  # is absent, so the package ships no systemd unit files.

  # README.md and AGENTS.md are developer documentation and are not packaged.
}
