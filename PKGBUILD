# Maintainer: VanillaGreen <brad@vanillagreen.com>
#
# The development package, built from main. docs/architecture/distribution-arch.md
# states the rules scripts/check-packaging.js enforces on
# this file and on ../vgs/PKGBUILD. makepkg rewrites pkgver from pkgver().

pkgname=vgs-git
pkgver=0.1.0
pkgrel=1
pkgdesc='Desktop shell for Hyprland, built on Quickshell (development version)'
arch=('any')
url='https://github.com/vanillagreencom/vgs'
license=('MIT AND OFL-1.1 AND ISC AND Apache-2.0')
depends=(
  'quickshell>=0.3.1'
  'hyprland>=0.56'
  'bash'
  'coreutils'
  'util-linux'
  'nodejs>=18'
  'python'
  'libxkbcommon'
  'xkeyboard-config'
  'git'
  'gum'
  'xdg-terminal-exec'
)
optdepends=(
  'wtype: Jarvis text and key input'
  'wlrctl: Jarvis pointer input without an input service'
  'ydotool: Jarvis pointer fallback with an already running input service'
  'agent-browser-bin: private Jarvis browser driver'
  'chromium: browser for Jarvis setup'
  'pipewire: Jarvis half-duplex audio capture, playback and discovery'
  'fd: launcher file and folder search'
  'fzf: launcher file search matching and the package pickers in floating TUIs'
  'bluez-utils: bluetoothctl, the Bluetooth pairing agent that answers pairing prompts'
  'file: launcher open-with list for a found file'
  'grim: launcher Screenshot'
  'slurp: launcher Screenshot region selection'
  'wl-clipboard: launcher Screenshot and Copy path, and the Jarvis clipboard tools'
  'libnotify: notify-send, to post notifications to the VGS notification server and from Jarvis'
  'playerctl: Jarvis media play, pause and next'
  'wireplumber: wpctl, for Jarvis speaker volume and mute'
  'xdg-utils: launcher Files'
  'pacman-contrib: checkupdates, for the package update check'
  'snapper: a snapshot before the update pipeline changes packages'
  'timeshift: a snapshot before the update pipeline changes packages, without snapper'
  'less: the last update log in the Updates flyout'
  'sudo: package installs and the browser policy writer in floating TUIs'
  'imagemagick: square Slack profile photos and custom emoji in notifications'
  'curl: Slack profile photos, custom emoji and Web API calls in notifications'
  'libsecret: secret-tool, for Slack tokens and Jarvis provider keys in the keyring'
  'bubblewrap: kernel confinement for Jarvis shell commands'
  'uv: installs the locked Jarvis local voice runtime'
  'glib2: gio, opens files and web links for Jarvis'
  'nvidia-utils: verifies a selected Jarvis CUDA local voice tier'
  'vsys: the agent dashboard and warden the Agent Warden plugin reads'
  'mise: Dev Tools installs, updates and removes developer tools'
  'cronie: crontab, which schedules automations where no systemd user manager answers'
  'systemd: before-suspend locking and Jarvis key presence without reading secrets'
  'iproute2: ss, for Jarvis local model-server discovery without inference'
  'tmux: several Jarvis coding tasks at once'
  'dbus: dbus-monitor, so the lock screen hears logind announce a suspend'
)
makedepends=('git')
provides=("vgs=$pkgver")
conflicts=('vgs' 'vgs-shell' 'vgs-shell-git')
source=("vgs::git+$url.git")
sha256sums=('SKIP')

# The tree's own version judge names the version, so the package and
# `vgsh --version` in the checkout print the same X.Y.Z.r<N>.g<hash>.
pkgver() {
  local out
  cd "$srcdir/vgs"
  out="$(./bin/vgsh version)" || return 1
  out="${out#vgs }"
  if [[ ! $out =~ ^[0-9]+\.[0-9]+\.[0-9]+\.r[0-9]+\.g[0-9a-f]+$ ]]; then
    printf 'vgs-git: refused: pkgver=%s\n' "$out" >&2
    return 1
  fi
  printf '%s\n' "$out"
}

package() {
  cd "$srcdir/vgs"
  DESTDIR="$pkgdir" PREFIX=/usr ./packaging/install-system.sh
}
