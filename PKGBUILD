# Maintainer : Ossian Mapes <self at ossian dot dev>
# Contributor : Bruno Ancona <bruno at powerball253 dot com>

pkgname=waybar-hyprland-cava-git
pkgver=0.9.18.r40.gb0f89f2b
pkgrel=1
pkgdesc='Highly customizable Wayland bar for Sway and Wlroots based compositors, with workspaces support for Hyprland, and cava (Cross-platform Audio Visualizer) support enabled. (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/Alexays/Waybar/'
license=('MIT')
provides=('waybar')
conflicts=('waybar')
depends=(
    'gtkmm3'
    'libjsoncpp.so'
    'libsigc++'
    'fmt'
    'jack' 
    'libjack.so'
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
    'wireplumber'
    'playerctl' 
    'fftw' 
    'alsa-lib' 
    'ncurses' 
    'iniparser' 
    'sndio' 
    'portaudio' 
    'fmt9'
    'spdlog-git'
)
makedepends=(
    'git'
    'cmake'
    'catch2'
    'meson'
    'scdoc'
    'wayland-protocols'
    'sndio' 
    'portaudio' 
    'libpulse'
    'curl'
)
backup=(
    etc/xdg/waybar/config
    etc/xdg/waybar/style.css
)
optdepends=(
    'otf-font-awesome: Icons in the default configuration'
)
source=("${pkgname}::git+https://github.com/Alexays/Waybar"
        hyprctl.patch)
sha256sums=('SKIP'
          '592b75ed945b66818b0ac687e3d79057031049f610d8c9366d2055821b8d0f8c') 

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    git apply ../hyprctl.patch # use hyprctl to switch workspaces
}

build() {
    cd "${srcdir}/${pkgname}"
    rm -rf "${srcdir}/build"

    meson --prefix=/usr \
          --buildtype=plain \
          --auto-features=enabled \
          -Dexperimental=true \
          -Dcava=enabled \
          "${srcdir}/build"
    ninja -C "${srcdir}/build"
}

package() {
    DESTDIR="$pkgdir" ninja -C "${srcdir}/build" install
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

