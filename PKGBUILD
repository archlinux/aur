# Maintainer: fossdd <fossdd@pwned.life>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=sway-rc
_pkgname=${pkgname%-rc}
_pkgver=1.9-rc1
pkgver=${_pkgver/-/}
pkgrel=1
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager (pre-release version)'
arch=(x86_64)
url='https://swaywm.org/'
conflicts=('sway' 'sway-git')
provides=('sway')
license=(MIT)
depends=(
  'cairo'
  'gdk-pixbuf2'
  'libevdev.so'
  'libinput'
  'libjson-c.so'
  'libudev.so'
  'libwayland-server.so'
  'libwlroots.so'
  'libxcb'
  'libxkbcommon.so'
  'pango'
  'pcre2'
  'ttf-font'
)
makedepends=(meson ninja scdoc setconf wayland-protocols)
backup=(
  etc/sway/config
  etc/sway/config.d/50-systemd-user.conf
)
optdepends=(
  'wmenu: Application launcher used in default config'
  'foot: Terminal emulator used in the default configuration'
  'i3status: Status line generation'
  'mako: Lightweight notification daemon'
  'polkit: System privilege control. Required if not using seatd service'
  'swaybg: Wallpaper tool for sway'
  'swayidle: Idle management daemon'
  'swaylock: Screen locker'
  'waybar: Highly customizable bar'
  'sway-contrib: Collection of user-contributed scripts for sway'
  'xorg-xwayland: X11 support'
  'xdg-desktop-portal-gtk: Default xdg-desktop-portal for file picking'
  'xdg-desktop-portal-wlr: xdg-desktop-portal backend'
)
source=("https://github.com/swaywm/sway/releases/download/$_pkgver/sway-$_pkgver.tar.gz"
        "https://github.com/swaywm/sway/releases/download/$_pkgver/sway-$_pkgver.tar.gz.sig"
        "50-systemd-user.conf"
        "sway-portals.conf")
install=sway.install
sha512sums=('cc174faab51a77f1f7c97b8af7d57219422b2d117409bb622e8a7974a8629d494a1263878a3bb8ab54ed163e9586cdffd04d39bd7242d875d8a8265cf1fc490a'
            'SKIP'
            'd5f9aadbb4bbef067c31d4c8c14dad220eb6f3e559e9157e20e1e3d47faf2f77b9a15e52519c3ffc53dc8a5202cb28757b81a4b3b0cc5dd50a4ddc49e03fe06e'
            'b9e708c775825c8124d8e154e523c90b8a32715050ba06f6dbcdd08d109eed484d128ccc8dcd6a49dc9cd51a0c9035779c2706b4d7a139115e85c4f54226b775')
validpgpkeys=('34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48'  # Simon Ser
              '9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A') # Drew DeVault

prepare() {
  cd "$_pkgname-$_pkgver"

  # Set the version information to 'Arch Linux' instead of 'makepkg'
  sed -i "s/branch \\\'@1@\\\'/Arch Linux/g" meson.build
}

build() {
  mkdir -p build
  arch-meson build "$_pkgname-$_pkgver" -D sd-bus-provider=libsystemd -D werror=false -D b_ndebug=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$_pkgname-$_pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"
  install -Dm644 sway-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/sway-portals.conf"
}

# vim: ts=2 sw=2 et
