# Maintainer: Joerg Weislogel <mutoroglin at posteo dot de>

pkgname=waybar-cava
pkgver=0.9.23
pkgrel=1
pkgdesc='Highly customizable Wayland bar for Sway and Wlroots based compositors, with module cava (Cross-platform Audio Visualizer)'
arch=('x86_64')
url='https://github.com/Alexays/Waybar/'
license=('MIT')
provides=('waybar')
conflicts=('waybar')
depends=(
    'gtkmm3'
    'libjsoncpp.so'
    'libsigc++'
    'fmt'
    'jack' 'libjack.so'
    'wayland'
    'libdate-tz.so'
    'spdlog'
    'gtk-layer-shell'
    'libupower-glib.so'
    'upower'
    'libevdev'
    'libinput'
    'libpulse'
    'libnl'
    'libappindicator-gtk3'
    'libdbusmenu-gtk3'
    'libmpdclient'
    'libsndio.so'
    'libxkbcommon'
    'wireplumber'
    'playerctl'
    'libcava'
)
makedepends=(
    'cmake'
    'catch2'
    'meson'
    'scdoc'
    'wayland-protocols'
)
backup=(
    etc/xdg/waybar/config
    etc/xdg/waybar/style.css
)
optdepends=(
    'otf-font-awesome: Icons in the default configuration'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Alexays/Waybar/archive/$pkgver.tar.gz"
)
sha256sums=('9b175e28f57453b54f9c426b0744ce883bf51e91527567cc1f9de1bd5c77b3c9'
)

build() {
    cd "Waybar-${pkgver}"

    # enable flag `experimental` to activate module wlr/workspaces
    meson setup \
          --prefix=/usr \
          --buildtype=plain \
          --auto-features=disabled \
          --wrap-mode=nodownload \
          -Dexperimental=true \
          -Ddbusmenu-gtk=enabled \
          -Dlibinput=enabled \
          -Dlibnl=enabled \
          -Dupower_glib=enabled \
          -Dmpris=enabled \
          -Dpulseaudio=enabled \
          -Dlibevdev=enabled \
          -Dlibudev=enabled \
          -Dmpd=enabled \
          -Djack=enabled \
          -Dgtk-layer-shell=enabled \
          -Drfkill=enabled \
          -Dsndio=enabled \
          -Dsystemd=enabled \
          -Dlogind=enabled \
          -Dman-pages=enabled \
          -Dwireplumber=enabled \
          -Dcava=enabled \
          -Dtests=disabled \
          build

    ninja -C build
}

package() {
    cd "${srcdir}/Waybar-${pkgver}"
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
