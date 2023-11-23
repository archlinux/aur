# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

_pkgbase=sway
pkgname=sway-hidecursor-leftbar
pkgver=1.8.1
pkgrel=4
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager'
arch=(x86_64)
url='https://swaywm.org/'
license=(MIT)
depends=(
  'cairo'
  'gdk-pixbuf2'
  'libevdev.so'
  'libinput'
  'libjson-c.so'
  'libudev.so'
  'libwayland-server.so'
  'libwlroots.so=11'
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
  'bemenu: Wayland-native alternative to dmenu'
  'dmenu: Application launcher used in default config'
  'foot: Terminal emulator used in the default configuration'
  'i3status: Status line generation'
  'mako: Lightweight notification daemon'
  'polkit: System privilege control. Required if not using seatd service'
  'swaybg: Wallpaper tool for sway'
  'swayidle: Idle management daemon'
  'swaylock: Screen locker'
  'waybar: Highly customizable bar'
  'xorg-xwayland: X11 support'
  'xdg-desktop-portal-gtk: Default xdg-desktop-portal for file picking'
  'xdg-desktop-portal-wlr: xdg-desktop-portal backend'
)
source=("https://github.com/swaywm/sway/releases/download/$pkgver/sway-$pkgver.tar.gz"
        "https://github.com/swaywm/sway/releases/download/$pkgver/sway-$pkgver.tar.gz.sig"
        "50-systemd-user.conf"
        "sys_nice_user_xkb_configs.patch"
        "sway-portals.conf"
        "hidecursor.patch"
        "leftbar.patch")
install=sway.install
sha512sums=('1504312a199608532e22336c5031e8f4749f5102ab321d13d97a1f93d49c8ec435e9097af729d8f7dfa81e2e96cee7de91cf4c04b6a7b7151ea740a1e43eb086'
            'SKIP'
            'd5f9aadbb4bbef067c31d4c8c14dad220eb6f3e559e9157e20e1e3d47faf2f77b9a15e52519c3ffc53dc8a5202cb28757b81a4b3b0cc5dd50a4ddc49e03fe06e'
            '156719e93d0213d1b54ce6e3a9b2dcc9246da5689dd2d3281546f9c042cbc69072f99b087e112fe777dcd786d2b9d1be1e1c9200feddffb5e2d16f8dfb27515d'
            '091a205bca875b6a78150b5b14ffaca996b7c7c3d6f68910e5891e5409ca070d27b3307e8c4916c1562a998d5bcb94406e961bf376d86e64c8ddf5afe5b41f76'
            'f6068630b09d8dde28244cdaffb94038894b42d0f936ce1fe51aa85003e6a6724bee0d96ad842ff1649d3e4f37eeca68fcd9b415f137df98cb72a7fa18cbe790'
            '044a0d4b5c77c0b3de9a16a9cd4ee18ab3bfffccc4c874dc498765e02cb9c758e5febd8b3649d43a85f229c9ab78bf2ab0e4e925872f47c34702e19c20e60cd2')
validpgpkeys=('34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48'  # Simon Ser
              '9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A') # Drew DeVault
conflicts=("$_pkgbase")

prepare() {
  cd "$_pkgbase-$pkgver"

  # Enable user xkb configs with cap_sys_nice - otherwise user xkb configs will
  # break.
  #
  # This patch was originally at
  # https://github.com/swaywm/sway/commit/2f2cdd60def006f6d3cbe318f9edd7d68fcb239a.patch
  # but failed to apply correctly to meson.build. We don't need that part of
  # the patch so just drop it.
  patch -p1 < ../sys_nice_user_xkb_configs.patch

  # Set the version information to 'Arch Linux' instead of 'makepkg'
  sed -i "s/branch \\\'@1@\\\'/Arch Linux/g" meson.build

  # Don't disable the cursor when hiding it.
  # https://github.com/lelgenio/sway/commit/b21dc487ac4bfc086cf295e06b8d8765a99e7266.patch
  patch -p1 < ../hidecursor.patch

  # Support left aligned status text in swaybar.
  patch -p1 < ../leftbar.patch
}

build() {
  export PKG_CONFIG_PATH='/usr/lib/wlroots0.16/pkgconfig'
  mkdir -p build
  arch-meson build "$_pkgbase-$pkgver" -D sd-bus-provider=libsystemd -D werror=false -D b_ndebug=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$_pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
  install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"
  install -Dm644 sway-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/sway-portals.conf"

  for util in autoname-workspaces.py inactive-windows-transparency.py grimshot; do
    install -Dm755 "$_pkgbase-$pkgver/contrib/$util" -t \
                   "$pkgdir/usr/share/$_pkgbase/scripts"
  done
}

# vim: ts=2 sw=2 et
