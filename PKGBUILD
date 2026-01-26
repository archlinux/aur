# Maintainer: Joerg Weislogel <mutoroglin at posteo dot de>

pkgname=waybar-cava
pkgver=0.14.0
pkgrel=3
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
    waybar-cava-0.14.0-3.patch
    cava.hpp
    cava_backend.hpp
    cava.cpp
    cava_backend.cpp
    libcava.wrap
    "$pkgname-$pkgver.tar.gz::https://github.com/Alexays/Waybar/archive/$pkgver.tar.gz"
)
sha256sums=('fe9067643d4a0d1539910e288f059c66d5a9c4af8304a7d95102f2da99c54088'
            '4e883e310119c20b2816d478634ecde4582e102142c08796f7bf39f1ceae61f4'
            '1daf3766b87f42090cc04fa1c07aa129164df33bb123b39fcdfcf006e00c55af'
            '347c547b73076c8ace8efeafabb6adf72527ae1b59ad80993c7774f77180fd71'
            '3ec2e1d77a226bdab8a0c3d8efdbd90570392840bc9752dbb8a9650f6eeaeda3'
            '2a2fee101c4cf06a6f9f328817923c20ceb99644d91a0a38c925891bd0bf283f'
            '7f3859779bb3a5028a7215b2000c2e476c03453a52289164ba60a4bf1bb3772f')

prepare() {
    echo $(pwd)
    cd "Waybar-$pkgver"

    mkdir include/modules/cava
    mkdir src/modules/cava

    rm include/modules/cava.hpp
    cp ../cava.hpp include/modules/cava
    cp ../cava_backend.hpp include/modules/cava
    rm src/modules/cava.cpp
    cp ../cava.cpp src/modules/cava
    cp ../cava_backend.cpp src/modules/cava
    rm subprojects/cava.wrap
    cp ../libcava.wrap subprojects/libcava.wrap

    # patch -p1 -i ../waybar-cava-0.14.0-2.patch1
    patch -p1 -i ../waybar-cava-0.14.0-3.patch
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
          -Dpipewire=enabled \
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
