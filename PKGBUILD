# Maintainer: Joerg Weislogel <mutoroglin at posteo dot de>

pkgname=waybar-cava
pkgver=0.14.0
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
    waybar-cava-0.14.0-2.patch1
    waybar-cava-0.14.0-2.patch2
    cava.hpp
    cava_backend.hpp
    cava.cpp
    cava_backend.cpp
    "$pkgname-$pkgver.tar.gz::https://github.com/Alexays/Waybar/archive/$pkgver.tar.gz"
)
sha256sums=('eaeb9a38a067f854f8f741832bd9b3fa2c853ddf79406272fc96e3535dada4f3'
            '8af473867caf7ff0afe6fad84000989124d7b73028bbd953d036122c395f79ee'
            'bce2d77ad22db7617c65aa74dc9c8fca4e2bdab5c1077b69042e265e000f15fc'
            '3214fc3e05312bbf83c33a7bc7b216ea5299a24ed5674e5c519f93b8b9c13fc6'
            '68cac73f262f0f9b9747b5b339a60215ed4cdb677469e7b9ae06cc1e4e74e88e'
            '0d59e480839b297bba735922fcc72c1f7e4822b38d0032f207afa9b9298181b7'
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

    patch -p1 -i ../waybar-cava-0.14.0-2.patch1
    patch -p1 -i ../waybar-cava-0.14.0-2.patch2
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
