# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

_pkgbase=sway
pkgname=sway-hidecursor-leftbar
pkgver=1.11
pkgrel=1
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
)
makedepends=(git meson ninja scdoc wayland-protocols)
backup=(
  etc/sway/config
  etc/sway/config.d/50-systemd-user.conf
)
optdepends=(
  'brightnessctl: Brightness adjustment tool used in the default configuration'
  'foot: Terminal emulator used in the default configuration'
  'grim: Screenshot utility used in the default configuration'
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
source=("git+https://github.com/swaywm/sway.git#tag=$pkgver?signed"
        "50-systemd-user.conf"
        "sway-portals.conf"
        "remove_git_version_format.patch"
        "hidecursor.patch"
        "leftbar.patch")
install=sway.install
sha512sums=('29e1eb9c4c5176c9e0ad10c27199f98b7356850090efbb85655c6f1569cce7173016b5a0482afc714e63a9da6cbf715652950b978a9e9363805e07ccb35d3f27'
            'd5f9aadbb4bbef067c31d4c8c14dad220eb6f3e559e9157e20e1e3d47faf2f77b9a15e52519c3ffc53dc8a5202cb28757b81a4b3b0cc5dd50a4ddc49e03fe06e'
            '4f9576b7218aef8152eb60e646985e96b13540b7a4fd34ba68fdc490199cf7a7b46bbee85587e41bffe81fc730222cf408d5712e6251edc85a0a0b0408c1a2df'
            'c3a450d3411b5ec6d4bcb485744213a49ee95698d3237804a7bf93258e091753de4666a2245ffe74129151749ec296be4d7741814380133b673f3fd2ec71932b'
            'f6068630b09d8dde28244cdaffb94038894b42d0f936ce1fe51aa85003e6a6724bee0d96ad842ff1649d3e4f37eeca68fcd9b415f137df98cb72a7fa18cbe790'
            '044a0d4b5c77c0b3de9a16a9cd4ee18ab3bfffccc4c874dc498765e02cb9c758e5febd8b3649d43a85f229c9ab78bf2ab0e4e925872f47c34702e19c20e60cd2')
validpgpkeys=('34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48'  # Simon Ser
              '9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A') # Drew DeVault
conflicts=("$_pkgbase")

prepare() {
  cd "$_pkgbase"
  # Patch meson.build to not use git version format (despite `git` presence in the build env)
  patch -Np1 -i "$srcdir/remove_git_version_format.patch"

  # Don't disable the cursor when hiding it.
  # https://github.com/lelgenio/sway/commit/b21dc487ac4bfc086cf295e06b8d8765a99e7266.patch
  patch -p1 < ../hidecursor.patch

  # Support left aligned status text in swaybar.
  patch -p1 < ../leftbar.patch
}

build() {
  mkdir -p build
  arch-meson build "$_pkgbase" -D sd-bus-provider=libsystemd -D werror=false -D b_ndebug=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$_pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
  install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"
  install -Dm644 sway-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/sway-portals.conf"
}

# vim: ts=2 sw=2 et
