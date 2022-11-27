# Maintainer: Francesco Carmelo Capria <francesco at capria dot eu>

pkgname=waybar-no-systemd
pkgver=0.9.16
pkgrel=1
pkgdesc='Highly customizable Wayland bar for Sway and Wlroots based compositors without systemd dependencies'
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
source=("https://github.com/Alexays/Waybar/archive/refs/tags/${pkgver}.tar.gz"
	meson-build.patch
	meson_options.patch)

sha1sums=('8816fd35e75c06ff2094b66047e4ec7bbc77a047'
          '3676ab3dff04f3c3e6bf5d2a2a1a7bd15d6a6cba'
          'e077c91a787e7d147e14c5b3284686cde1e32d7c')

prepare() {
    cd "${srcdir}/Waybar-${pkgver}"
    patch -p1 < ../meson-build.patch
    patch -p1 < ../meson_options.patch
}

build() {
    cd "${srcdir}/Waybar-${pkgver}"
    rm -rf "${srcdir}/build"
    meson --prefix=/usr "${srcdir}/build"
    ninja -C "${srcdir}/build"
}

package() {
    DESTDIR="$pkgdir" ninja -C "${srcdir}/build" install
    install -Dm644 "${srcdir}/Waybar-${pkgver}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
