# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=sway-im-git
_pkgname=sway
pkgver=r7200.5c99b98805e8
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
            'affc2bb0060ed060259114385f7f24d27c716eb8fc0d1f027fa96bbe1c468115683055931422b183e6fbba5f3ed77a13edb0efca8f95c4aff4cf1a9f2e265adb'
            '091a205bca875b6a78150b5b14ffaca996b7c7c3d6f68910e5891e5409ca070d27b3307e8c4916c1562a998d5bcb94406e961bf376d86e64c8ddf5afe5b41f76')

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
