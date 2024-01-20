# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=sway-im-git
_pkgname=sway
pkgver=r7269.ae33f4eb37a8
pkgrel=1
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager (git version with input method popups)'
arch=(x86_64)
url='https://swaywm.org/'
license=(MIT)
depends=(
  'cairo'
  'gdk-pixbuf2'
  'json-c'
  'pango'
  'polkit'
  'pcre2'
  'swaybg'
  'ttf-font'
  'wlroots-git'
)
makedepends=(git meson ninja scdoc setconf wayland-protocols)
backup=(
  etc/sway/config
  etc/sway/config.d/50-systemd-user.conf
)
optdepends=(
  'wmenu: Application launcher used in default config'
  'foot: Terminal emulator used in the default configuration'
  'grim: Screenshot utility'
  'i3status: Status line generation'
  'mako: Lightweight notification daemon'
  'slurp: Select a region'
  'swayidle: Idle management daemon'
  'swaylock: Screen locker'
  'wallutils: Timed wallpapers'
  'waybar: Highly customizable bar'
  'xorg-xwayland: X11 support'
  'xdg-desktop-portal-gtk: Default xdg-desktop-portal for file picking'
  'xdg-desktop-portal-wlr: xdg-desktop-portal backend'
)
source=("sway::git+https://github.com/swaywm/sway.git"
        "50-systemd-user.conf"
        "7226.patch"
        "sway-portals.conf")
provides=("sway")
conflicts=("sway")
install=sway.install
sha512sums=('SKIP'
            'd5f9aadbb4bbef067c31d4c8c14dad220eb6f3e559e9157e20e1e3d47faf2f77b9a15e52519c3ffc53dc8a5202cb28757b81a4b3b0cc5dd50a4ddc49e03fe06e'
            'bcdd0ab109fb4138137398aae402a7f2cb576a672fb9ece5ef186f3c08ffa71571d2f941728b79917ce0f8b513f1567aef255fcf4ede1358b35167e88a6d8dc3'
            'b9e708c775825c8124d8e154e523c90b8a32715050ba06f6dbcdd08d109eed484d128ccc8dcd6a49dc9cd51a0c9035779c2706b4d7a139115e85c4f54226b775')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=12 HEAD)"
}

prepare() {
  cd "$_pkgname"

  # Set the version information to 'Arch Linux' instead of 'makepkg'
  sed -i "s/branch \\\'@1@\\\'/Arch Linux/g" meson.build

  patch -Np1 -i ../7226.patch
}

build() {
  mkdir -p build
  arch-meson build "$_pkgname" -D sd-bus-provider=libsystemd -D werror=false -D b_ndebug=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"
  install -Dm644 sway-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/sway-portals.conf"
}

# vim: ts=2 sw=2 et
