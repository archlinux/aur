# Maintainer: Umut Dag <umu7d9@gmail.com>

pkgname=waybar-temp-fan-power
pkgver=0.14.0
pkgrel=3
pkgdesc='Highly customizable Wayland bar for Sway and Wlroots based compositors (with temperature module fan and power support)'
arch=('x86_64')
url="https://github.com/umtdg/Waybar"
license=('MIT')
depends=(
    'atkmm'
    'cairomm'
    'fmt'
    'gcc-libs'
    'glib2'
    'glibc'
    'glibmm'
    'gpsd'
    'gtk-layer-shell'
    'gtk3'
    'gtkmm3'
    'jack'
    'jsoncpp'
    'libdbusmenu-gtk3'
    'libevdev'
    'libinput'
    'libmpdclient'
    'libnl'
    'libpipewire'
    'libpulse'
    'libsigc++'
    'libwireplumber'
    'libxkbcommon'
    'playerctl'
    'sndio'
    'spdlog'
    'systemd-libs'
    'upower'
    'wayland'
)
makedepends=(
    'catch2'
    'cmake'
    'meson'
    'glib2-devel' # gdbus-codegen
    'scdoc' # For generating manpages
    'wayland-protocols'
)
backup=(
    etc/xdg/waybar/config.jsonc
    etc/xdg/waybar/style.css
)
optdepends=(
    'otf-font-awesome: Icons in the default configuration'
)
conflicts=('waybar')
provides=('waybar')
source=("$pkgname-$pkgver.tar.gz::https://github.com/umtdg/Waybar/archive/$pkgver.tar.gz")
b2sums=('4c4558de389a6bbd3b3e8416745c8689721635bdbd4656969b1ecd6b95e2fea59ab74cfcccc65f83644a731ccbb80f16e4cf5dce66882fb38afbf672f5ab64ed')

build() {
    cd "Waybar-$pkgver"
    meson --prefix=/usr \
          --buildtype=plain \
          --auto-features=enabled \
          --wrap-mode=nodownload \
          -Dcpp_std=c++20 \
          -Dexperimental=true \
          -Dcava=disabled \
          -Dtests=enabled \
          build
    meson compile -C build
}

check() {
    cd "Waybar-$pkgver"
    meson test -C build --print-errorlogs --no-rebuild --suite waybar
}

package() {
    depends+=(
      'libatkmm-1.6.so'
      'libcairomm-1.0.so'
      'libgtk-3.so'
      'libjack.so'
      'libjsoncpp.so'
      'libpipewire-0.3.so'
      'libsndio.so'
      'libspdlog.so'
      'libudev.so'
      'libupower-glib.so'
    )

    cd "Waybar-$pkgver"
    meson install -C build --destdir "$pkgdir"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
