# Maintainer: Victor Coscrato <vcoscrato@users.noreply.github.com>

pkgname=speshell-git
pkgver=r21.g6b88cf8
pkgrel=1
pkgdesc="A desktop shell built with Quickshell: a bar and its panels, a launcher, and animated themes"
arch=('any')
url="https://github.com/vcoscrato/speshell"
license=('MIT')
depends=(
  'bash'
  'bluez'
  'coreutils'
  'jq'
  'libnotify'
  'networkmanager'
  'pipewire'
  'procps-ng'
  'polkit'
  'pyalpm'
  'python'
  'quickshell>=0.3.0'
  'sudo'
  'systemd'
  'upower'
  'util-linux'
  'which'
  'wireplumber'
)
makedepends=('git' 'just' 'qt6-shadertools')
optdepends=(
  'hyprland: workspaces in the bar and the Displays panel'
  'curl: downloading the dictation model, and AUR search in the System window'
  'paru: AUR packages in speshell system (or yay)'
  'pacman-contrib: the count of updates waiting in the System window'
  'brightnessctl: brightness and keyboard backlight controls, and dimming on idle'
  'power-profiles-daemon: the system power profile following the power mode'
  'cliphist: clipboard history'
  'greetd: the login screen'
  'matugen: theming other apps from the Speshell palette'
  'openconnect: OpenConnect VPN logins'
  'libsecret: remembering VPN passwords in the keyring'
  'grim: screenshot, copy text, and scan code tools'
  'hyprpicker: pick color tool'
  'slurp: area selection for the screenshot, copy text, record, and scan code tools'
  'swappy: annotating screenshots'
  'tesseract: copy text tool (with a tesseract-data package per language)'
  'wf-recorder: record tool'
  'pipewire-audio: dictation tool, recording the microphone'
  'whisper-cpp: dictation tool'
  'wl-clipboard: clipboard capture, copy actions, and the tools'
  'wtype: dictation tool, typing the text'
  'zbar: scan code tool'
  'xdg-utils: opening the config when VISUAL and EDITOR are unset or no terminal is found'
)
provides=('speshell')
conflicts=('speshell')
source=("speshell::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  if [ -d speshell ]; then
    cd speshell
  fi
  printf 'r%s.g%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd speshell
  just shaders
}

package() {
  cd speshell

  # The shell as Quickshell loads it, with the themes and effects it ships; each
  # effect reaches effects/common through a relative symlink. Its two commands find
  # the shell through their links.
  install -d "$pkgdir/usr/share/speshell" "$pkgdir/usr/bin"
  cp -r shell/. "$pkgdir/usr/share/speshell/"
  ln -s ../share/speshell/speshell "$pkgdir/usr/bin/speshell"
  ln -s ../share/speshell/greeter/speshell-greeter "$pkgdir/usr/bin/speshell-greeter"

  install -Dm644 README.md "$pkgdir/usr/share/doc/speshell/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 shell/icons/tabler/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.tabler-icons"

  # The desktop entry, the units that copy a user's theme for the login screen, and
  # the login screen's directories under /var/lib/speshell.
  install -Dm644 packaging/speshell.desktop "$pkgdir/usr/share/applications/speshell.desktop"
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" packaging/speshell-greeter-theme@.{path,service}
  install -Dm644 packaging/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/speshell.conf"
}
