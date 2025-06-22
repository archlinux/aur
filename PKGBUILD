# Maintainer: Joerg Weislogel <mutoroglin at posteo dot de>

pkgname=waybar-cava
pkgver=0.12.0
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
    waybar-0.12.0-2.patch
)
sha256sums=('80454a0778176f575c112bdef9107f272621b578aa629bcc257ad9844a6c7165'
            '2b88e9ff76905fc05d12a1e44869e4deba1a2536d3d2ad49744cf25cc9d639f2')

prepare() {
    echo $(pwd)
    ls -hal
    cd Waybar-$pkgver
    patch -p1 -i ../waybar-0.12.0-2.patch
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
