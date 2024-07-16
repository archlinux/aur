# Maintainer: fossdd <fossdd@pwned.life>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=sway-disable-titlebar
_pkgname=${pkgname%-disable-titlebar}
pkgver=1.9
pkgrel=3
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager (added disable_titlebar open - PR #8026)'
arch=(x86_64)
url='https://swaywm.org/'
conflicts=('sway' 'sway-git' 'sway-rc')
provides=('sway')
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
  'wlroots0.17'
  'xcb-util-wm'
)
makedepends=(meson ninja scdoc setconf wayland-protocols)
backup=(
  etc/sway/config
  etc/sway/config.d/50-systemd-user.conf
)
optdepends=(
  'foot: Terminal emulator used in the default configuration'
  'i3status: Status line generation'
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
source=("https://github.com/swaywm/sway/releases/download/$pkgver/sway-$pkgver.tar.gz"
        "https://github.com/swaywm/sway/releases/download/$pkgver/sway-$pkgver.tar.gz.sig"
        "https://github.com/swaywm/sway/pull/8026.patch"
        "50-systemd-user.conf"
        "sway-portals.conf")
install=sway.install
sha512sums=('1d2a47bb8b838573a32f3719a7329fd744119c2c7efc5e5a4168b2bacfb09a3901a569177e5e10c129141fafe00e823ab78c04b76b502d23caa7621bbccd5919'
            'SKIP'
            'SKIP'
            'd5f9aadbb4bbef067c31d4c8c14dad220eb6f3e559e9157e20e1e3d47faf2f77b9a15e52519c3ffc53dc8a5202cb28757b81a4b3b0cc5dd50a4ddc49e03fe06e'
            'b9e708c775825c8124d8e154e523c90b8a32715050ba06f6dbcdd08d109eed484d128ccc8dcd6a49dc9cd51a0c9035779c2706b4d7a139115e85c4f54226b775')
validpgpkeys=('34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48'  # Simon Ser
              '9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A') # Drew DeVault

prepare() {
  cd "$_pkgname-$pkgver"

  patch --forward --strip=1 --input=../8026.patch

  # Set the version information to 'Arch Linux' instead of 'makepkg'
  sed -i "s/branch \\\'@1@\\\'/Arch Linux/g" meson.build
}

build() {
  export PKG_CONFIG_PATH='/usr/lib/wlroots0.17/pkgconfig'
  mkdir -p build
  arch-meson build "$_pkgname-$pkgver" -D sd-bus-provider=libsystemd -D werror=false -D b_ndebug=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"
  install -Dm644 sway-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/sway-portals.conf"
}

# vim: ts=2 sw=2 et
