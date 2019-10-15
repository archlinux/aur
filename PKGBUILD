# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=sway
pkgver=1.2
epoch=1
pkgrel=5
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
source=("https://github.com/swaywm/sway/releases/download/$pkgver/sway-$pkgver.tar.gz"
        "https://github.com/swaywm/sway/releases/download/$pkgver/sway-$pkgver.tar.gz.sig"
        "10-systemd.conf")
sha512sums=('e3842e0da58a1678289aa24fc84f6841deeea6e9ffe04407525e5b9d62ed177d890133ff07412317c811f5b07a2e5073d14ff59a30e62111f51fc65af0dddb19'
            'SKIP'
            '122b97f7adb6444c442368c5bbbd3401bcd8420f522fcd6521def5a09cd2989f5f6f555a5a7762e922eaa307077eb26db6508242ee1b835ca73ad65acaeef95b')
validpgpkeys=('9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A') # Drew DeVault

prepare() {
  cd "$pkgname-$pkgver"

  # Set the version information to 'Arch Linux' instead of 'makepkg'
  sed -i "s/branch \\\'@1@\\\'/Arch Linux/g" meson.build
}

build() {
  mkdir -p build
  arch-meson build "$pkgname-$pkgver" -D werror=false -D b_ndebug=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 10-systemd.conf "$pkgdir/etc/sway/conf.d/10-systemd.conf"
}

# vim: ts=2 sw=2 et
