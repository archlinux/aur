# Maintainer: Joerg Weislogel <mutoroglin at posteo dot de>

pkgname=waybar-cava
pkgver=0.11.0
pkgrel=2
pkgdesc='Highly customizable Wayland bar for Sway and Wlroots based compositors, with module cava (Cross-platform Audio Visualizer)'
arch=('x86_64')
url='https://github.com/Alexays/Waybar/'
license=('MIT')
provides=('waybar')
conflicts=('waybar')
#    'libdate-tz.so'
depends=(
    'gtkmm3'
    'libjsoncpp.so'
    'libsigc++'
    'fmt'
    'jack' 'libjack.so'
    'wayland'
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
    'glib2-devel'
)
makedepends=(
    'cmake'
    'catch2'
    'meson'
    'scdoc'
    'wayland-protocols'
)
backup=(
    etc/xdg/waybar/config.jsonc
    etc/xdg/waybar/style.css
)
optdepends=(
    'otf-font-awesome: Icons in the default configuration'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Alexays/Waybar/archive/$pkgver.tar.gz"
    "fix-systray.patch::https://github.com/Alexays/Waybar/commit/0d02f6877d88551ea2be0cd151c1e6354e208b1c.patch"
)
sha256sums=('6a0e9f0f7f2eff503951958cbb16dc39041c0b67e86c35154e8507677c61be9d'
            '7ca2c4be684ad2d51f5c278400d37f7179c4f242d84268de1b74d443568a83d5')

prepare() {
    echo $(pwd)
    cd "Waybar-$pkgver"
    patch -p1 < "${srcdir}/fix-systray.patch"
}

build() {
    cd "Waybar-${pkgver}"

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
          -Drfkill=enabled \
          -Dsndio=enabled \
          -Dsystemd=enabled \
          -Dlogind=enabled \
          -Dman-pages=enabled \
          -Dwireplumber=enabled \
          -Dcava=enabled \
          -Dtests=disabled \
          build

#          -Dgtk-layer-shell=enabled \

    ninja -C build
}

package() {
    cd "${srcdir}/Waybar-${pkgver}"

    DESTDIR="$pkgdir" ninja -C build install

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
