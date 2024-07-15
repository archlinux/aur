# Maintainer: GalaxySnail <me+aur@glxys.nl>
# Contributor: Hyeon Kim <simnalamburt@gmail.com>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: tinywrkb <tinywrkb@gmail.com>

pkgname=sway-im
pkgver=1.9
epoch=1
pkgrel=2
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager, with input method popups v2 support'
arch=(x86_64)
url='https://swaywm.org/'
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
  'libwlroots.so=12'
  'libxcb'
  'libxkbcommon.so'
  'pango'
  'pcre2'
  'ttf-font'
  # requires wlroots0.17 explicitly
  # see: https://gitlab.archlinux.org/pacman/pacman/-/issues/54
  'wlroots0.17'
  'xcb-util-wm'
)
makedepends=(meson ninja scdoc setconf wayland-protocols)
backup=(
  etc/sway/config
  etc/sway/config.d/50-systemd-user.conf
)
optdepends=(
  'dmenu: dmenu_path support (used alongside wmenu in default $menu)'
  'grim: Screenshot utility'
  'foot: Terminal emulator used in the default configuration'
  'i3status: Status line generation'
  'mako: Lightweight notification daemon'
  'polkit: System privilege control. Required if not using seatd service'
  'slurp: Select a region'
  'swaybg: Wallpaper tool for sway'
  'sway-contrib: Collection of user-contributed scripts for sway'
  'swayidle: Idle management daemon'
  'swaylock: Screen locker'
  'wallutils: Timed wallpapers'
  'waybar: Highly customizable bar'
  'wmenu: Application launcher used in default config'
  'xorg-xwayland: X11 support'
  'xdg-desktop-portal-gtk: Default xdg-desktop-portal for file picking'
  'xdg-desktop-portal-wlr: xdg-desktop-portal backend'
)
source=("https://github.com/swaywm/sway/releases/download/$pkgver/sway-$pkgver.tar.gz"
        "https://github.com/swaywm/sway/releases/download/$pkgver/sway-$pkgver.tar.gz.sig"
        "50-systemd-user.conf"
        "sway-portals.conf"
        "0001-text_input-Implement-input-method-popups.patch"
        "0002-chore-fractal-scale-handle.patch"
        "0003-chore-left_pt-on-method-popup.patch")
install=sway.install
sha512sums=('1d2a47bb8b838573a32f3719a7329fd744119c2c7efc5e5a4168b2bacfb09a3901a569177e5e10c129141fafe00e823ab78c04b76b502d23caa7621bbccd5919'
            'SKIP'
            'd5f9aadbb4bbef067c31d4c8c14dad220eb6f3e559e9157e20e1e3d47faf2f77b9a15e52519c3ffc53dc8a5202cb28757b81a4b3b0cc5dd50a4ddc49e03fe06e'
            '4f9576b7218aef8152eb60e646985e96b13540b7a4fd34ba68fdc490199cf7a7b46bbee85587e41bffe81fc730222cf408d5712e6251edc85a0a0b0408c1a2df'
            '07343bed09ca1689e647465d38013dc42e5a290bf8bcce57244eaccc7c3c858f04ec5d2786dc3af193a070faa89606598cccba66cd52d4078973afb757d5b72e'
            'dd013a9c6859dc0210aa55a519c1df4c5899e164d7a6c7f86f831dcd37f9b26839f24e7bc2dc066ee7fad38ff91bcae9516a0c3bffebb09c35c8133f0af10bc8'
            'dba122283df29239ff94cac20c74f28937822573474bebf3865096bc073ef366412ccead4d1c46197c93eefc09d2c8af74de782f5be2a462d7911020c7a43d0e')
validpgpkeys=('34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48'  # Simon Ser
              '9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A') # Drew DeVault
conflicts=('sway')
provides=(
  'sway'
  'wayland-compositor'
)

prepare() {
  cd "sway-$pkgver"

  # Set the version information to 'Arch Linux' instead of 'makepkg'
  sed -i "s/branch \\\'@1@\\\'/Arch Linux/g" meson.build

  # sway-im patch:
  # https://github.com/swaywm/sway/pull/7226#event-11545284120
  # https://github.com/swaywm/sway/commits/0789c12a8edf46fbc1c7024e153f3e8f8f35fe12
  # commit 0789c12a is the lastest commit before wlroots scene graph api
  patch -Np1 -i ../0001-text_input-Implement-input-method-popups.patch
  patch -Np1 -i ../0002-chore-fractal-scale-handle.patch
  patch -Np1 -i ../0003-chore-left_pt-on-method-popup.patch
}

build() {
  export PKG_CONFIG_PATH='/usr/lib/wlroots0.17/pkgconfig'
  mkdir -p build
  arch-meson build "sway-$pkgver" -D sd-bus-provider=libsystemd -D werror=false -D b_ndebug=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "sway-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"
  install -Dm644 sway-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/sway-portals.conf"
}

# vim: ts=2 sw=2 et
