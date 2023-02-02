# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=sway-im-git
_pkgname=sway
pkgver=r7063.ae2d14ce
pkgrel=1
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
  'pcre'
  'swaybg'
  'ttf-font'
  'wlroots-git'
)
makedepends=(git meson ninja scdoc setconf wayland-protocols)
backup=(etc/sway/config)
optdepends=(
  'dmenu: Application launcher'
  'grim: Screenshot utility'
  'i3status: Status line'
  'mako: Lightweight notification daemon'
  'slurp: Select a region'
  'swayidle: Idle management daemon'
  'swaylock: Screen locker'
  'wallutils: Timed wallpapers'
  'waybar: Highly customizable bar'
  'xorg-xwayland: X11 support'
)
source=("sway::git+https://github.com/swaywm/sway.git"
        "50-systemd-user.conf"
	"0001-text_input-Implement-input-method-popups.patch")
provides=("sway")
conflicts=("sway")
options=(debug)
install=sway.install
sha512sums=('SKIP'
            'c2b7d808f4231f318e03789015624fd4cf32b81434b15406570b4e144c0defc54e216d881447e6fd9fc18d7da608cccb61c32e0e1fab2f1fe2750acf812d3137'
            'dc598c3e5990a0b7fac96b298eeffb24450165908e68be08ceb0a653d5c08abb217ac58348835752b2bbbddd81a6e1f671b3b6cef8c5714e2357ed0bd3b604f5')
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd "$_pkgname"

  # Set the version information to 'Arch Linux' instead of 'makepkg'
  sed -i "s/branch \\\'@1@\\\'/Arch Linux/g" meson.build

  patch -Np1 -i ../0001-text_input-Implement-input-method-popups.patch
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

  for util in autoname-workspaces.py inactive-windows-transparency.py grimshot; do
    install -Dm755 "$_pkgname/contrib/$util" -t \
                   "$pkgdir/usr/share/$_pkgname/scripts"
  done
}

# vim: ts=2 sw=2 et
