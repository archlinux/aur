# Maintainer: rawalrauf <rawalbaloch78@gmail.com>
pkgname=waybar-active-last
pkgver=0.14.0
pkgrel=6
pkgdesc='Highly customizable Wayland bar for Sway and Wlroots based compositors (with active-last patch)'
arch=('x86_64')
url='https://github.com/Alexays/Waybar/'
license=('MIT')
depends=(
  'gtk3'
  'gtkmm3'
  'libdbusmenu-gtk3'
  'libevdev'
  'libinput'
  'libmpdclient'
  'libnl'
  'libpulse'
  'libsigc++'
  'jsoncpp'
  'spdlog'
  'wayland'
  'fmt'
  'jack'
  'libxkbcommon'
  'upower'
  'gpsd'
  'gtk-layer-shell'
  'wireplumber'
  'libsndio.so'
)
makedepends=(
  'cmake'
  'meson'
  'scdoc'
  'wayland-protocols'
  'glib2-devel'
)
optdepends=(
  'otf-font-awesome: Icons in the default configuration'
)
provides=('waybar')
conflicts=('waybar')
source=(
  "waybar-$pkgver.tar.gz::https://github.com/Alexays/Waybar/archive/$pkgver.tar.gz"
  'active-last.patch'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  cd "Waybar-$pkgver"
  patch -p1 < "$srcdir/active-last.patch"
}

build() {
  cd "Waybar-$pkgver"
  meson setup --prefix=/usr \
              --libexecdir=lib \
              --sbindir=bin \
              --buildtype=plain \
              --auto-features=enabled \
              --wrap-mode=default \
              -D b_lto=false \
              -D b_pie=true \
              -D cava=disabled \
              build
  meson compile -C build
}

package() {
  cd "Waybar-$pkgver"
  meson install -C build --destdir "$pkgdir"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
