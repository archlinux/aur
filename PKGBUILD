# Maintainer: Jonathan Lahav <j.lahav@gmail.com>

pkgname=owbox
pkgver=0.8.1
pkgrel=1
pkgdesc="Stacking Wayland compositor based on Openbox, compatible with its config and themes (not Openbox itself)"
arch=('x86_64' 'aarch64')
url="https://github.com/SoleSoul/owbox"
license=('GPL-2.0-or-later')
depends=('wlroots0.20' 'libinput' 'libxkbcommon' 'pixman' 'glib2' 'libxml2'
         'pango' 'cairo' 'librsvg' 'libsfdo' 'xcb-util-wm' 'wayland')
makedepends=('meson' 'wayland-protocols')
checkdepends=('foot' 'grim' 'python-cairo' 'python-gobject')
optdepends=('xorg-xwayland: X applications'
            'xdg-desktop-portal-wlr: screenshots and screen sharing'
            'wireplumber: screen sharing (connects the streams)'
            'xdg-desktop-portal-gtk: file choosers and other portals'
            'python-gobject: owbox Settings'
            'gtk4: owbox Settings'
            'foot: a terminal emulator (or any other, set TERMINAL)'
            'grim: screenshots (Print Screen)'
            'slurp: screenshots of an area'
            'wl-clipboard: screenshots copied to the clipboard'
            'libpulse: the volume keys (pactl)'
            'playerctl: the media keys'
            'brightnessctl: the brightness keys'
            'polkit-gnome: password prompts for administrator actions'
            'swaylock: locking the screen'
            'libnotify: the volume, brightness and screenshot notifications'
            'swaybg: a wallpaper'
            'waybar: the panels (see /usr/share/owbox/examples)'
            'fuzzel: the launcher tapping Super shows'
            'fcitx5: input methods'
            'openbox: more themes')
backup=('etc/xdg/owbox/rc.xml' 'etc/xdg/owbox/menu.xml'
        'etc/xdg/owbox/autostart' 'etc/xdg/owbox/environment')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5c73cb17306d41990790c5e2ff7aee6113b9c346447038be7c3526208f04b5ae')

build() {
  arch-meson "$pkgname-$pkgver" "$pkgname-$pkgver/build"
  meson compile -C "$pkgname-$pkgver/build"
}

check() {
  cd "$pkgname-$pkgver"
  # the smoke test runs owbox on the headless backend
  export XDG_RUNTIME_DIR="$(mktemp -d)"
  chmod 700 "$XDG_RUNTIME_DIR"
  tests/smoke.py
}

package() {
  cd "$pkgname-$pkgver"
  meson install -C build --destdir "$pkgdir"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md CHANGELOG.md docs/*.md
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
