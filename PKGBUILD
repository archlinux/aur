# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=sway-im-git
_pkgname=sway
pkgver=r7236.7e69a7076fc8
pkgrel=2
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
            '462ac3cfaac850fd62e127bc401e588227b52ec6d466ff8926631de7a0f8de05e407b6fe47baa6ee1463c6256ce1ab81236c58329225e9288d3bb5aea558a0c6'
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
