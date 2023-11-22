# Maintainer: GalaxySnail <me+aur@glxys.nl>
# Contributor: Hyeon Kim <simnalamburt@gmail.com>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: tinywrkb <tinywrkb@gmail.com>

pkgname=sway-im
pkgver=1.8.1
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
  'grim: Screenshot utility'
  'foot: Terminal emulator used in the default configuration'
  'i3status: Status line generation'
  'mako: Lightweight notification daemon'
  'polkit: System privilege control. Required if not using seatd service'
  'slurp: Select a region'
  'swaybg: Wallpaper tool for sway'
  'swayidle: Idle management daemon'
  'swaylock: Screen locker'
  'wallutils: Timed wallpapers'
  'waybar: Highly customizable bar'
  'xorg-xwayland: X11 support'
  'xdg-desktop-portal-gtk: Default xdg-desktop-portal for file picking'
  'xdg-desktop-portal-wlr: xdg-desktop-portal backend'
)
source=("https://github.com/swaywm/sway/releases/download/$pkgver/sway-$pkgver.tar.gz"
        "https://github.com/swaywm/sway/releases/download/$pkgver/sway-$pkgver.tar.gz.sig"
        "50-systemd-user.conf"
        "sway-portals.conf"
        "sys_nice_user_xkb_configs.patch"
        "0001-text_input-Implement-input-method-popups.patch"
        "0002-backport-sway-im-to-v1.8.patch")
install=sway.install
sha512sums=('1504312a199608532e22336c5031e8f4749f5102ab321d13d97a1f93d49c8ec435e9097af729d8f7dfa81e2e96cee7de91cf4c04b6a7b7151ea740a1e43eb086'
            'SKIP'
            'd5f9aadbb4bbef067c31d4c8c14dad220eb6f3e559e9157e20e1e3d47faf2f77b9a15e52519c3ffc53dc8a5202cb28757b81a4b3b0cc5dd50a4ddc49e03fe06e'
            '091a205bca875b6a78150b5b14ffaca996b7c7c3d6f68910e5891e5409ca070d27b3307e8c4916c1562a998d5bcb94406e961bf376d86e64c8ddf5afe5b41f76'
            '156719e93d0213d1b54ce6e3a9b2dcc9246da5689dd2d3281546f9c042cbc69072f99b087e112fe777dcd786d2b9d1be1e1c9200feddffb5e2d16f8dfb27515d'
            'f3a0bf6b48ecb09b229ba286f57c1a43e83848c187816b6784df1a3640c083759e8236bc949c8097044d3af218813757b636226a097e495d993fd682f20ceb96'
            'f5441d4da5c9c43a5f70e56eb00fcec7a56c3f76dbe03cbaab55b7bd1ea82ff8fbae1e1ae3e8dfaf1860db8e76635fc578649e537b609eb914e068cb9c4929d1')
validpgpkeys=('34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48'  # Simon Ser
              '9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A') # Drew DeVault
conflicts=('sway')
provides=('sway')

prepare() {
  cd "sway-$pkgver"

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

  # sway-im patch: https://github.com/swaywm/sway/pull/7226
  patch -Np1 -i ../0001-text_input-Implement-input-method-popups.patch
  patch -Np1 -i ../0002-backport-sway-im-to-v1.8.patch
}

build() {
  export PKG_CONFIG_PATH='/usr/lib/wlroots0.16/pkgconfig'
  mkdir -p build
  arch-meson build "sway-$pkgver" -D sd-bus-provider=libsystemd -D werror=false -D b_ndebug=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "sway-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"
  install -Dm644 sway-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/sway-portals.conf"

  for util in autoname-workspaces.py inactive-windows-transparency.py grimshot; do
    install -Dm755 "sway-$pkgver/contrib/$util" -t \
                   "$pkgdir/usr/share/sway/scripts"
  done
}

# vim: ts=2 sw=2 et
