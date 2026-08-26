# Maintainer: yogh-io <info@yogh.nl>
pkgname=talkey-git
# The scripts probe /usr/share/talkey for their data dir, so the share tree is
# named after the project, not the package. Only pkgname carries the -git.
_name=talkey
# A placeholder. makepkg runs pkgver() against the clone and rewrites this line
# in place, so whatever is committed here is only what the AUR page shows until
# the next build.
pkgver=0.1.0.r25.g4a6d40f
pkgrel=1
pkgdesc="Push-to-talk voice input for X11/i3 - hold a key, speak, the text is typed. Offline, no API key."
arch=('any')
url="https://github.com/yogh-io/talkey"
license=('MIT')
depends=(
  'bash'
  'whisper-cpp'
  'ffmpeg'
  'xdotool'
  'xorg-xset'
  'libpulse'
  'curl'
  # The HUD. Nominally talkey only writes state files and any renderer could
  # read them, but eww is the only renderer there is - without it you dictate
  # blind, with tones and notifications for feedback. That is not the program
  # this is, so it is a dependency rather than a nice-to-have. eww is AUR-only,
  # and it needs both of these to render a tick.
  'eww'
  'inotify-tools'
  'jq'
  # talkey-setup reads your keycodes off the keyboard with this. 37KB, and
  # without it the one step that cannot be done from documentation - turning a
  # key you press into a number - falls back to typing numbers by hand.
  'xorg-xev'
)
optdepends=(
  'whisper.cpp-model-large-v3-turbo: the default speech model (AUR) - talkey needs some model'
  'whisper.cpp-model-small: translate-to-English support (AUR)'
  'python: live word-by-word text in the HUD as you speak - dictation itself does not need it'
  'libnotify: desktop notifications alongside the HUD, and the only feedback if you disable it'
  'ollama: names archived recordings after what you said - needs a model pulled too (default qwen2.5:3b)'
  'xclip: paste mode (TALKEY_PASTE=1) instead of typing'
  'sxhkd: key bindings without i3'
  'xbindkeys: key bindings without i3'
)
makedepends=('git')
provides=("$_name")
conflicts=("$_name")
install="$pkgname.install"
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

# Tagged: 0.1.0.r12.gabc1234. Untagged: the same shape from the commit count, so
# an untagged repo still produces an increasing version. Testing the captured
# string rather than the pipeline's exit status is deliberate - sed succeeds on
# empty input, so `git describe || fallback` would leave pkgver empty until the
# first tag exists.
pkgver() {
  cd "$pkgname"
  local v
  v="$(git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
  [[ -n "$v" ]] || v="0.1.0.r$(git rev-list --count HEAD).g$(git rev-parse --short=7 HEAD)"
  printf '%s' "$v"
}

package() {
  cd "$pkgname"

  # Executables. Sibling scripts are found via $SCRIPT_DIR, so they must all
  # land in the same bindir.
  install -Dm755 -t "$pkgdir/usr/bin" \
    bin/talkey \
    bin/talkey-setup \
    bin/talkey-doctor \
    bin/talkey-diag \
    bin/talkey-mic-check \
    bin/talkey-replay \
    bin/talkey-live-pump \
    bin/talkey-norepeat \
    bin/talkey-whisper-server \
    integrations/eww/talkey-hud

  # Read-only data. The layout under this root matches a git checkout exactly,
  # so the scripts resolve it with one probe and behave identically either way.
  install -Dm644 -t "$pkgdir/usr/share/$_name" vocabulary.txt
  install -Dm644 -t "$pkgdir/usr/share/$_name/lib" lib/common.sh
  install -Dm644 -t "$pkgdir/usr/share/$_name/sounds" sounds/*.wav
  install -Dm644 -t "$pkgdir/usr/share/$_name/bindings" \
    bindings/i3.conf bindings/sxhkdrc bindings/xbindkeysrc bindings/README.md
  install -Dm644 -t "$pkgdir/usr/share/$_name/config" config/talkey.env.example
  install -Dm644 -t "$pkgdir/usr/share/$_name/integrations/eww" \
    integrations/eww/eww.yuck integrations/eww/eww.scss integrations/eww/blank.svg \
    integrations/eww/README.md
  install -Dm755 -t "$pkgdir/usr/share/$_name/integrations/eww" integrations/eww/eww-feed

  # User units, with the installed path baked in. talkey-hud and talkey-norepeat
  # are optional - a window manager can start them instead - but a service is the
  # only WM-independent way, so ship them.
  local u
  for u in talkey-whisper talkey-hud talkey-norepeat; do
    sed 's|@BINDIR@|/usr/bin|g' "systemd/$u.service.in" > "$srcdir/$u.service"
    install -Dm644 "$srcdir/$u.service" "$pkgdir/usr/lib/systemd/user/$u.service"
  done

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
