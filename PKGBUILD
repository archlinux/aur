# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Juuso Ranne <juuso.ranne@protonmail.com>

pkgauthor=vimma-browser
pkgname=vimma-bin
pkgver=0.1.25
pkgrel=1
pkgdesc="Keyboard-first web browser built on Firefox, with Neovim-style modes and a tmux-style prefix keymap"

arch=('x86_64')
license=('MPL-2.0')
url="https://github.com/vimma-browser/vimma"

depends=('alsa-lib' 'dbus' 'gtk3' 'libxt' 'mime-types' 'ttf-font' 'hicolor-icon-theme')
optdepends=('networkmanager: location detection via available Wi-Fi networks'
            'libpulse: PulseAudio audio (also via pipewire-pulse)'
            'ffmpeg: H.264, AAC and MP3 playback')

provides=('vimma')
conflicts=('vimma')

options=('!strip' '!debug')

source_x86_64=("vimma-${pkgver}-linux-${arch[0]}.tar.xz::https://github.com/vimma-browser/vimma/releases/download/v${pkgver}/vimma-${pkgver}-linux-${arch[0]}.tar.xz")
sha256sums_x86_64=('7b7d6edc2fd68e4bbcd777f9a81e72fb0ddcc15f2111e384714edaddac897647')

package() {
  install -d "$pkgdir/opt" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
  cp -a "$srcdir/vimma" "$pkgdir/opt/vimma"
  ln -s /opt/vimma/vimma "$pkgdir/usr/bin/vimma"
  # The tarball's control client (spec ship-vimma-ctl).
  ln -s /opt/vimma/vimma-ctl "$pkgdir/usr/bin/vimma-ctl"
  # Tells Vimma how it was installed (spec m6a-updater, section 3).
  printf '%s\n' 'vimma-package=pkgbuild-release' > "$pkgdir/opt/vimma/is-packaged-app"
  cat > "$pkgdir/opt/vimma/vimma-open" <<'VIMMA_OPEN_EOF'
#!/bin/sh
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# vimma-open: the desktop entry's launcher, and the command for `BROWSER=vimma-open` (specs
# docs/specs/workspace-routing.md, decision 6, and docs/specs/app-routes.md, decisions 6 to 10).
# The running Vimma gets a command line over D-Bus with nothing about who sent it. This walks
# the parent processes in /proc, nearest first, past openers and wrappers, keeping every other
# program and shell up to the terminal or app the desktop started (`python3,zsh,herdr,zsh,
# ghostty`), and hands `vimma -vimma-from <names> <url>` off with VIMMA_FROM=<names> (read by a
# Vimma that this call starts), so `[[routes]] app = "..."` rules can apply. The names are a
# hint: only lower-case tokens are passed, and Vimma checks them again. When no name is known (a
# Flatpak app behind the portal, a parent already gone), it hands off `vimma <url>`.
# `vimma-open --from <app> <url>` names the program itself and skips the walk. Any other
# arguments go to `vimma` unchanged.
#
# A step of the walk starts no process (the shell's `read`, never cat or tr; only under an
# AppImage runtime, a readlink to recognise it), and the walk never runs a command of a
# multiplexer it passes: its server ends the list, since nothing it could ask names the right
# terminal (app-routes, decision 7).
#
# VIMMA_BIN (the browser), VIMMA_OPEN_PROC and VIMMA_OPEN_PPID (a fake /proc, for tests) override.
# They give the caller no more than `--from` does: whatever they point at comes out only as
# token names.

proc=${VIMMA_OPEN_PROC:-/proc}

# The browser: VIMMA_BIN, else the vimma next to this script (the packages install both in one
# directory), else vimma on PATH.
bin=${VIMMA_BIN:-}
if [ -z "$bin" ]; then
  here=$(dirname "$(readlink -f "$0")")
  if [ -x "$here/vimma" ]; then bin="$here/vimma"; else bin=vimma; fi
fi

# Whether $1 is a token: [a-z0-9][a-z0-9._+-]{0,63}. Letters are listed, not ranges: a range
# follows the locale's collation in some shells.
token() {
  case $1 in
    '' | *[!abcdefghijklmnopqrstuvwxyz0123456789._+-]* | [!abcdefghijklmnopqrstuvwxyz0123456789]*)
      return 1
      ;;
  esac
  [ "${#1}" -le 64 ]
}

# $1 lower-cased, into $low, with no process: comm is at most 15 bytes.
UPPER=ABCDEFGHIJKLMNOPQRSTUVWXYZ
LOWER=abcdefghijklmnopqrstuvwxyz
lower() {
  s=$1
  low=
  while [ -n "$s" ]; do
    c=${s%"${s#?}"}
    s=${s#?}
    case $c in
      [ABCDEFGHIJKLMNOPQRSTUVWXYZ])
        before=${UPPER%%"$c"*}
        rest=$LOWER
        n=${#before}
        while [ "$n" -gt 0 ]; do
          rest=${rest#?}
          n=$((n - 1))
        done
        c=${rest%"${rest#?}"}
        ;;
    esac
    low=$low$c
  done
}

# Openers and wrappers between the program and us, never the program meant.
skip() {
  case "$1" in
    xdg-open | gio | gio-launch-desk* | gtk-launch | kde-open | kde-open5 | kde-open6) return 0 ;;
    kioclient* | exo-open | exo-helper-* | gnome-open | gvfs-open | wslview) return 0 ;;
    sensible-browse* | x-www-browser | www-browser | vimma | vimma-open) return 0 ;;
    open | osascript | env | nohup | setsid | timeout | login) return 0 ;;
  esac
  return 1
}

# Where the chain ends without a name: init, the user's systemd, the portal, the compositor or
# session. Naming them would let `app = "hyprland"` match every link.
stop() {
  case "$1" in
    systemd | init | launchd | xdg-desktop-por* | flatpak-portal | flatpak-session*) return 0 ;;
    hyprland | sway | river | niri | kwin_wayland | kwin_x11 | gnome-shell | plasmashell) return 0 ;;
    gnome-session* | xfce4-session | uwsm | sddm | gdm* | lightdm | xorg | xwayland) return 0 ;;
  esac
  return 1
}

# The whole of /proc/<pid>/stat into $stat; a comm may hold a newline.
read_stat() {
  stat=
  # Checked first: a failed redirection on a loop may end a POSIX shell.
  [ -r "$proc/$1/stat" ] || return 1
  first=1
  while IFS= read -r line || [ -n "$line" ]; do
    if [ -n "$first" ]; then stat=$line; first=; else stat="$stat
$line"; fi
  done <"$proc/$1/stat"
  [ -n "$stat" ]
}

walk() {
  list=
  count=0
  last=
  # "blind" when the walk passed a name that is not a token or hit the step limit, so it may
  # not have seen the terminal; else "seen" (pid 1, a stop-list process, a parent that is gone).
  ended=seen
  pid=${VIMMA_OPEN_PPID:-$PPID}
  steps=0
  while :; do
    [ "$pid" -gt 1 ] 2>/dev/null || break
    if [ "$steps" -ge 32 ]; then
      ended=blind
      break
    fi
    steps=$((steps + 1))
    read_stat "$pid" 2>/dev/null || break
    # "pid (comm) state ppid ...": comm may hold spaces and parentheses, so cut at the last ")".
    rest=${stat##*) }
    ppid=${rest#* }
    ppid=${ppid%% *}
    comm=${stat#*\(}
    comm=${comm%) *}
    lower "$comm"
    case $low in
      "tmux: server" | "tmux: client") low=tmux ;;
    esac
    if [ -n "${APPIMAGE:-}" ] && [ "$(readlink "$proc/$pid/exe" 2>/dev/null)" = "$APPIMAGE" ]; then
      : # the AppImage runtime that started our AppRun: its exe is the .AppImage file
    elif stop "$low"; then
      break
    elif skip "$low"; then
      :
    elif ! token "$low"; then
      # Passed over, not an end: a child that renames itself (prctl, a copy named "a b") must
      # not hide an agent CLI's name above it from the agent rule (app-routes, decision 5).
      ended=blind
    elif [ "$low" != "$last" ]; then
      list="$list $low"
      count=$((count + 1))
      last=$low
    fi
    [ "$ppid" = "$pid" ] && break
    pid=$ppid
  done
  # A terminal the walk could not see (VS Code's helper is not a token) names itself, last.
  # Never after a walk that ended normally: a job an agent CLI left behind is reparented to pid 1
  # and still inherits the terminal's TERM_PROGRAM (app-routes, decision 8).
  if [ "$ended" = blind ] && [ -n "${TERM_PROGRAM:-}" ] && [ "${#TERM_PROGRAM}" -le 64 ]; then
    lower "$TERM_PROGRAM"
    if token "$low"; then
      case " $list " in
        *" $low "*) ;;
        *)
          list="$list $low"
          count=$((count + 1))
          ;;
      esac
    fi
  fi
  # At most eight: the seven nearest and the farthest, the terminal or app rules name most.
  names=
  i=0
  for n in $list; do
    i=$((i + 1))
    if [ "$i" -le 7 ] || [ "$i" -eq "$count" ]; then names="$names,$n"; fi
  done
  names=${names#,}
}

# The browser in its own session, so a caller that waits for its browser command (CPython's
# webbrowser, gh) returns at once, and a Vimma this starts is never the terminal's child.
handoff() {
  # Inside an AppImage (its AppRun runs us from the mount, $APPDIR), the runtime unmounts the
  # image once this process exits, so the browser runs in its place instead. Checked by our own
  # path: another AppImage app's APPIMAGE and APPDIR reach its children too.
  # APPDIR is compared resolved too, as our own path is: the mount can sit under a symlink
  # (macOS's /var/folders is /private/var/folders, a TMPDIR that is a link).
  if [ -n "${APPDIR:-}" ]; then
    appdir=$(readlink -f "$APPDIR" 2>/dev/null)
    # An empty one would make the pattern "/*", which every path matches.
    [ -n "$appdir" ] || appdir=$APPDIR
    case $(readlink -f "$0") in
      "$APPDIR"/* | "$appdir"/*) exec "$@" ;;
    esac
  fi
  if command -v setsid >/dev/null 2>&1; then
    setsid -f "$@" </dev/null >/dev/null 2>&1
  else
    nohup "$@" </dev/null >/dev/null 2>&1 &
  fi
  exit 0
}

# A single argument that starts with "-" would reach vimma as a flag (-profile,
# -remote-debugging-port...): refuse it.
refuse_flag() {
  case "$1" in
    -*)
      echo "vimma-open: refusing a URL that is a flag: $1" >&2
      exit 64
      ;;
  esac
}

if [ "${1-}" = "--from" ]; then
  if [ "$#" -ne 3 ] || ! token "$2"; then
    echo "vimma-open: --from takes a program name ([a-z0-9][a-z0-9._+-]*, at most 64) and one URL" >&2
    exit 64
  fi
  refuse_flag "$3"
  VIMMA_FROM=$2
  export VIMMA_FROM
  handoff "$bin" -vimma-from "$2" "$3"
fi

if [ "$#" -eq 1 ]; then
  refuse_flag "$1"
  walk
  if [ -n "$names" ]; then
    VIMMA_FROM=$names
    export VIMMA_FROM
    handoff "$bin" -vimma-from "$names" "$1"
  fi
  # Never a VIMMA_FROM this launcher did not set (one inherited from the caller's environment).
  unset VIMMA_FROM
  handoff "$bin" "$1"
fi

unset VIMMA_FROM
exec "$bin" "$@"
VIMMA_OPEN_EOF
  chmod 755 "$pkgdir/opt/vimma/vimma-open"
  ln -s /opt/vimma/vimma-open "$pkgdir/usr/bin/vimma-open"
  cat > "$pkgdir/usr/share/applications/vimma-vimma.desktop" <<'VIMMA_DESKTOP_EOF'
[Desktop Entry]
Version=1.5
Type=Application
Name=Vimma
GenericName=Web Browser
Comment=Browse the web from the keyboard
Exec=/opt/vimma/vimma-open %u
Icon=vimma
Terminal=false
StartupNotify=true
StartupWMClass=vimma-vimma
Categories=Network;WebBrowser;
MimeType=application/json;application/pdf;application/rdf+xml;application/rss+xml;application/x-xpinstall;application/xhtml+xml;application/xml;audio/flac;audio/ogg;audio/webm;image/avif;image/gif;image/jpeg;image/png;image/svg+xml;image/webp;text/html;text/xml;video/ogg;video/webm;x-scheme-handler/http;x-scheme-handler/https;
Keywords=Internet;WWW;Browser;Web;Explorer;vim;
Actions=new-window;new-private-window;open-profile-manager;

[Desktop Action new-window]
Name=New Window
Exec=vimma --new-window %u

[Desktop Action new-private-window]
Name=New Private Window
Exec=vimma --private-window %u

[Desktop Action open-profile-manager]
Name=Open the Profile Manager
Exec=vimma --ProfileManager
VIMMA_DESKTOP_EOF
  chmod 644 "$pkgdir/usr/share/applications/vimma-vimma.desktop"
  local size
  for size in 16 32 48 64 128; do
    install -Dm644 "$srcdir/vimma/browser/chrome/icons/default/default${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/vimma.png"
  done
}
