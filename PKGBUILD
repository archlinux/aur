# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=sway
pkgver=1.2
epoch=1
pkgrel=4
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager'
arch=(x86_64)
url='https://swaywm.org/'
license=(MIT)
depends=(cairo gdk-pixbuf2 json-c pango pcre swaybg ttf-font wlroots)
makedepends=(git meson ninja scdoc setconf wayland-protocols)
backup=(etc/sway/config)
optdepends=(
  'dmenu: Application launcher'
  'i3status: Status line'
  'grim: Screenshot utility'
  'mako: Lightweight notification daemon'
  'rxvt-unicode: Terminal emulator'
  'slurp: Select a region'
  'swayidle: Idle management daemon'
  'swaylock: Screen locker'
  'wallutils: Timed wallpapers'
  'waybar: Highly customizable bar'
  'xorg-server-xwayland: X11 support'
)
source=('git+https://github.com/swaywm/sway#commit=be138dab4419d3e76a7742428d9ec85bce06116b'
        10-systemd.conf)
md5sums=('SKIP'
         'e614ac10c21d57da6b3af25653589a9e')

prepare() {
  cd $pkgname

  # Set the version information to 'Arch Linux' instead of 'makepkg'
  sed -i "s/branch \\\'@1@\\\'/Arch Linux/g" meson.build
}

build() {
  mkdir -p build
  arch-meson build $pkgname -D werror=false -D b_ndebug=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 10-systemd.conf "$pkgdir/etc/sway/conf.d/10-systemd.conf"
}

# vim: ts=2 sw=2 et
