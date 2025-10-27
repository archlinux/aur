# Maintainer: dawsers <dawser at gmx dot com>
# Based on sway, with thanks to its maintainers:
# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=sway-scroll-stable
pkgver=1.11.8
epoch=1
pkgrel=1
pkgdesc='Fork of the sway Wayland compositor with a scrolling layout like PaperWM or niri (stable version)'
arch=(x86_64)
url='https://github.com/dawsers/scroll'
license=(MIT)
depends=(
  'cairo'
  'gdk-pixbuf2'
  'libevdev.so'
  'libinput'
  'libjson-c.so'
  'libpixman-1.so'
  'libudev.so'
  'libwayland-server.so'
  'libxcb'
  'libxkbcommon.so'
  'pango'
  'pcre2'
  'ttf-font'
  'wlroots0.19'
  'xcb-util-wm'
  'lua'
)
makedepends=(git meson ninja scdoc wayland-protocols)
provides=('sway-scroll-stable' 'wayland-compositor')
conflicts=('sway-scroll-git')
backup=(
  etc/scroll/config
  etc/scroll/config.d/50-systemd-user.conf
)
optdepends=(
  'brightnessctl: Brightness adjustment tool used in the default configuration'
  'foot: Terminal emulator used in the default configuration'
  'i3status: Status line generation'
  'libpulse: Volume adjustment tool (pactl) used in the default configuration'
  'mako: Lightweight notification daemon'
  'polkit: System privilege control. Required if not using seatd service'
  'swaybg: Wallpaper tool for sway'
  'sway-contrib: Collection of user-contributed scripts for sway'
  'swayidle: Idle management daemon'
  'swaylock: Screen locker'
  'waybar: Highly customizable bar'
  'wmenu: Application launcher used in default config'
  'xorg-xwayland: X11 support'
  'xdg-desktop-portal-gtk: Default xdg-desktop-portal for file picking'
  'xdg-desktop-portal-wlr: xdg-desktop-portal backend'
)
source=("git+https://github.com/dawsers/scroll.git#tag=$pkgver"
        "50-systemd-user.conf"
        "scroll-portals.conf"
        "remove_git_version_format.patch")
install=sway-scroll-stable.install
sha512sums=(SKIP
            SKIP
            SKIP
            SKIP)

prepare() {
  cd scroll
  # Patch meson.build to not use git version format (despite `git` presence in the build env)
  patch -Np1 -i "$srcdir/remove_git_version_format.patch"
}

build() {
  mkdir -p build
  arch-meson build scroll -D sd-bus-provider=libsystemd -D werror=false -D b_ndebug=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "scroll/LICENSE" "$pkgdir/usr/share/licenses/scroll/LICENSE"
  install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/scroll/config.d/"
  install -Dm644 scroll-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/scroll-portals.conf"
}

# vim: ts=2 sw=2 et

