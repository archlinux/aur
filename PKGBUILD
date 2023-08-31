# Maintainer:  Giovanni Santini <giovannisantini93@yahoo.it>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=waybar-hyprland
pkgver=0.9.22
pkgrel=1
pkgdesc='Highly customizable Wayland bar for Sway and Wlroots based compositors, with workspaces support for Hyprland'
arch=('x86_64')
url="https://github.com/Alexays/Waybar/"
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
)
makedepends=(
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/Alexays/Waybar/archive/$pkgver.tar.gz")
sha256sums=('61e8d934c178b9da8212162398d2be44c5606c92b9a3503526993bb204206c6b')

build() {
    cd "${srcdir}/Waybar-${pkgver}"

    # use hyprctl to switch workspaces
    sed -i \
        's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' \
        src/modules/wlr/workspace_manager.cpp

    # TODO tests depend on catch2 v3
    CXXFLAGS+=" -std=c++20" \
    arch-meson \
          -Dexperimental=true \
          -Dcava=disabled \
          -Dtests=disabled \
          build
    meson compile -C build
}

package() {
    cd "${srcdir}/Waybar-${pkgver}"
    meson install -C build --destdir "$pkgdir"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
