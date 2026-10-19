# Maintainer: Jonathan Lahav <j.lahav@gmail.com>

pkgname=owbox-git
_name=owbox
pkgver=0.3.0.r0.fc013a7
pkgrel=1
pkgdesc="Stacking Wayland compositor based on Openbox, compatible with its config and themes (not Openbox itself; latest commit)"
arch=('x86_64' 'aarch64')
url="https://github.com/SoleSoul/owbox"
license=('GPL-2.0-or-later')
depends=('wlroots0.20' 'libinput' 'libxkbcommon' 'pixman' 'glib2' 'libxml2'
         'pango' 'cairo' 'librsvg' 'libsfdo' 'xcb-util-wm' 'wayland')
makedepends=('git' 'meson' 'wayland-protocols')
optdepends=('xorg-xwayland: X applications'
            'xdg-desktop-portal-wlr: screenshots and screen sharing'
            'wireplumber: screen sharing (connects the streams)'
            'xdg-desktop-portal-gtk: file choosers and other portals'
            'python-gobject: owbox Settings'
            'gtk4: owbox Settings'
            'foot: a terminal emulator for the default menu'
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
            'openbox: more themes')
backup=('etc/xdg/owbox/rc.xml' 'etc/xdg/owbox/menu.xml'
        'etc/xdg/owbox/autostart' 'etc/xdg/owbox/environment')
provides=('owbox')
conflicts=('owbox')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/^v//; s/-/.r/; s/-g/./'
}

build() {
  arch-meson "$_name" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  cd "$_name"
  install -Dm644 -t "$pkgdir/usr/share/doc/$_name" README.md CHANGELOG.md docs/*.md
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
