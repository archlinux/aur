# Maintainer: mahirsn <mahirsuna72@gmail.com>
pkgname=mmsimpulse-git
pkgver=r44.f5b0b16
pkgrel=1
pkgdesc="A Wayland session of KWin plus the illogical-impulse shell — no desktop environment"
arch=('any')
url="https://github.com/mahirsn/mmsimpulse"
license=('GPL-3.0-or-later')
# Any KWin 6 satisfies this: the stock `kwin` package, or a fork such as
# The compositor is used as installed and never rebuilt. python-dbus and
# python-gobject are the KWin bridge; the rest are what the session and shell
# scripts call.
# imagemagick, wl-clipboard, libnotify and spectacle are hard dependencies
# rather than optional ones: without them the screen snip captures nothing,
# crops nothing, copies nothing and reports nothing, which looks like a broken
# feature rather than a missing package. spectacle is there because stock KWin
# only lets callers with a declared desktop entry use its screenshot service.
depends=('kwin' 'kglobalacceld' 'quickshell' 'xdg-desktop-portal-kde'
         'python' 'python-dbus' 'python-gobject' 'rsync' 'git' 'jq' 'systemd'
         'imagemagick' 'wl-clipboard' 'libnotify' 'spectacle')
optdepends=(
  'powerdevil: idle timeouts, DPMS, suspend and brightness'
  'upower: battery status'
  'kdeplasma-addons: task switcher layouts, without which Alt+Tab draws nothing'
  'kitty: the terminal the launcher and widgets open by default'
  'cliphist: clipboard history'
  'matugen: colours generated from the wallpaper'
  'brightnessctl: laptop backlight control'
  'ddcutil: external monitor brightness over DDC/CI'
  'playerctl: media keys and player control'
  'tesseract: text recognition on a snipped region'
  'wf-recorder: screen recording'
  'bc: arithmetic in the theming scripts'
  'breeze: the default cursor theme, which KWin warns about when absent'
  'illogical-impulse-basic: the widget set this shell is built on'
  'illogical-impulse-audio: audio widgets and OSDs'
  'illogical-impulse-backlight: brightness control'
  'illogical-impulse-fonts-themes: Material Symbols and the shell fonts'
  'illogical-impulse-portal: file pickers and screen sharing'
  'illogical-impulse-python: colour generation for the theming scripts'
  'illogical-impulse-screencapture: region screenshot and recording'
  'ydotool: cursor warping, which KWin exposes no D-Bus call for'
)
makedepends=('git')
provides=('mmsimpulse')
conflicts=('mmsimpulse')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  # The session itself is package-owned, so a normal install needs no sudo
  # prompt and the login manager sees the entry immediately.
  install -Dm755 session/start-mmsimpulse "$pkgdir/usr/bin/start-mmsimpulse"
  sed 's|@BIN@|/usr/bin|' session/mmsimpulse.desktop \
    | install -Dm644 /dev/stdin "$pkgdir/usr/share/wayland-sessions/mmsimpulse.desktop"

  # The per-user half — the shell config, the bridge, the shortcuts — is
  # assembled in $HOME and cannot be built here, so the package ships the
  # tooling and `mmsimpulse-install` does that part once.
  install -d "$pkgdir/usr/share/mmsimpulse"
  cp -a bin kwin-script overlay session shortcuts install.sh README.md TESTING.md \
        "$pkgdir/usr/share/mmsimpulse/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/mmsimpulse-install" <<'WRAPPER'
#!/bin/sh
# Sets up mmsimpulse for the current user. Safe to re-run: it is also how you
# pick up an updated base skin or a new release of this package.
exec /usr/share/mmsimpulse/install.sh "$@"
WRAPPER

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 TESTING.md "$pkgdir/usr/share/doc/$pkgname/TESTING.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
