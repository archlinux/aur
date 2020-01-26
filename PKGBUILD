# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Maintainer: Brett Cornwall <ainola@archlinux.org>

pkgname=sway
pkgver=1.4
epoch=1
pkgrel=3
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
        "50-systemd-user.conf")
sha512sums=('3b280bdfdbdae8fb9b4f555bc630c64e7c1d09f7b2c783b99413863a6b620d50cd2b6d10d63e11fdfb9c678fce9a403228ac52fa69fb52561ffbd06790505a71'
            'SKIP'
            '6314b7e4053c33f46d6f33c85fb34a0287286ad943438bad9c69ef32d328f848d03293ca93cb07a3ec97b77ee62b6c404f97ebf2ce60cdf9f6ba118d95666979')
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
  install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"
}

# vim: ts=2 sw=2 et
