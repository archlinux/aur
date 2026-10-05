# Maintainer: VanillaGreen <brad@vanillagreen.com>
#
# The development package, built from main. docs/architecture/distribution-arch.md
# states the rules scripts/check-packaging.js enforces on
# this file and on ../vgshell/PKGBUILD. makepkg rewrites pkgver from pkgver().

pkgname=vgshell-git
pkgver=0.1.0
pkgrel=1
pkgdesc='Desktop shell for Hyprland, built on Quickshell (development version)'
arch=('any')
url='https://github.com/vanillagreencom/vgshell'
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
  'agent-browser-bin'
  'bubblewrap'
  'chromium'
  'curl'
  'dbus'
  'fd'
  'ffmpeg'
  'file'
  'fzf'
  'glib2'
  'gpu-screen-recorder'
  'grim'
  'gum'
  'hyprpicker'
  'imagemagick'
  'iproute2'
  'less'
  'libnotify'
  'libpulse'
  'libsecret'
  'mise'
  'networkmanager'
  'pacman-contrib'
  'pipewire'
  'pipewire-audio'
  'playerctl'
  'qrencode'
  'slurp'
  'systemd'
  'tesseract'
  'tesseract-data-eng'
  'uv'
  'vsys'
  'wireplumber'
  'wl-clipboard'
  'wlrctl'
  'wtype'
  'xdg-terminal-exec'
  'xdg-utils'
)
optdepends=(
  'voxtype-bin: Voice dictation engine'
  'tmux: several Jarvis coding tasks at once'
  'ydotool: Jarvis pointer fallback with an already running input service'
  'bluez-utils: bluetoothctl, the Bluetooth pairing agent that answers pairing prompts'
  'snapper: a snapshot before the update pipeline changes packages'
  'timeshift: a snapshot before the update pipeline changes packages, without snapper'
  'sudo: package installs and the browser policy writer in floating TUIs'
  'nvidia-utils: verifies a selected Jarvis CUDA local voice tier'
  'ddcutil: brightness of external displays in the Displays plugin'
  'brightnessctl: brightness of a laptop built-in display in the Displays plugin'
  'cronie: crontab, which schedules automations where no systemd user manager answers'
  'greetd: the login screen at boot'
  'uwsm: the Hyprland (uwsm-managed) session the login screen starts first'
  'xorg-xinit: startx, for X11 sessions on the login screen'
  'glibc: getent, the accounts on the login screen'
  'polkit: pkexec, so applications can ask for administrator access'
  'tailscale: the Tailscale connection in the VPN plugin'
)
makedepends=('git')
install=vgshell-git.install

# No git+ source: makepkg clones one as a mirror of every ref the remote
# advertises, and GitHub's refs/pull/* still reach the history main no
# longer holds. This clone takes main alone, with every commit and tree but
# only the file contents its checkout needs, so pkgver() counts the commits
# a full clone counts. Tags pointing into main come with it, for the
# release version pkgver() names.
prepare() {
  rm -rf -- "$srcdir/vgshell"
  git clone --filter=blob:none --single-branch --branch main -- "$url.git" "$srcdir/vgshell"
}

# The tree's own version judge names the version, so the package and
# `vgshell --version` in the checkout print the same X.Y.Z.r<N>.g<hash>.
pkgver() {
  local out
  cd "$srcdir/vgshell"
  out="$(./bin/vgshell version)" || return 1
  out="${out#vgshell }"
  if [[ ! $out =~ ^[0-9]+\.[0-9]+\.[0-9]+\.r[0-9]+\.g[0-9a-f]+$ ]]; then
    printf 'vgshell-git: refused: pkgver=%s\n' "$out" >&2
    return 1
  fi
  printf '%s\n' "$out"
}

package() {
  cd "$srcdir/vgshell"
  DESTDIR="$pkgdir" PREFIX=/usr SYSCONFDIR=/etc ./packaging/install-system.sh
}
