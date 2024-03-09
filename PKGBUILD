# Maintainer: vpertys
# Modified based on waybar-git and waybar-cava

pkgname=waybar-cava-git
pkgver=r3293.4c46d7d2
pkgrel=1
pkgdesc='Highly customizable Wayland bar for Sway and Wlroots based compositors, with module cava (GIT)'
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
    'libspdlog.so'
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
    'libwireplumber'
    'playerctl'
    'libcava'
)
makedepends=(
    'git'
    'cmake'
    'catch2'
    'meson'
    'scdoc' # For generating manpages
    'wayland-protocols'
)
backup=(
    etc/xdg/waybar/config
    etc/xdg/waybar/style.css
)
optdepends=(
    'otf-font-awesome: Icons in the default configuration'
)
source=("${pkgname}::git+https://github.com/Alexays/Waybar")
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    rm -rf "${srcdir}/build"
    meson setup \
          --prefix=/usr \
          --buildtype=plain \
          --auto-features=enabled \
          -Dexperimental=true \
          -Dcava=enabled \
          -Dtests=disabled \
          "${srcdir}/build"
    ninja -C "${srcdir}/build"
}

package() {
    DESTDIR="$pkgdir" ninja -C "${srcdir}/build" install
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
