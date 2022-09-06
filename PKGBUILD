# Maintainer: ston <2424284164@qq.com>

pkgname=waybar-hyprland
pkgver=0.9.13
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
    'wayland'
    'libdate-tz.so'
    'libspdlog.so'
    'gtk-layer-shell'
    'libupower-glib.so'
    'upower'
    'libevdev'
    'libpulse'
    'libnl'
    'libappindicator-gtk3'
    'libdbusmenu-gtk3'
    'libmpdclient'
    'libsndio.so'
    'libxkbcommon'
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
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Alexays/Waybar/archive/$pkgver.tar.gz"
    "https://patch-diff.githubusercontent.com/raw/Alexays/Waybar/pull/1617.patch"
)
sha256sums=('9e6553274ce3013d2be9912f975287efe4dfd38de4e335db43a73aff2a3b0a34'
            'bedf05c1aeecd9fad517bc91583d3054de97b07e92c63e75220b16f728f10112')

prepare() {
    cd "Waybar-$pkgver"
    # Fix fmt 9 compilation issues. This is on master but not yet part of a
    # release
    patch -p1 < ../1617.patch
}

build() {
    cd "Waybar-$pkgver"
    meson --prefix=/usr \
          --buildtype=plain \
          --auto-features=enabled \
          --wrap-mode=nodownload \
          build
    sed -i 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp # use hyprctl to switch workspaces
    meson configure -Dexperimental=true build
    ninja -C build
}

package() {
    cd "Waybar-$pkgver"
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
