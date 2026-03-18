# Maintainer: Umut Dag <me@umtdg.com>
# Modified PKGBUILD of https://aur.archlinux.org/packages/waybar-git

## options
: ${_use_sodeps:=false}

: ${_with_cava:=false}
: ${_with_gpsd:=false}

_pkgname="waybar"
pkgname="$_pkgname-temp-fan-power"
pkgver=0.15.0
pkgrel=1
pkgdesc='Highly customizable Wayland bar for Sway and Wlroots based compositors (with temperature module fan and power support)'
arch=('x86_64')
url="https://github.com/umtdg/Waybar"
license=('MIT')
depends=(
    'fmt'
    'gtk-layer-shell'
    'gtkmm3'
    'jack'
    'jsoncpp'
    'libdbusmenu-gtk3'
    'libevdev'
    'libinput'
    'libmpdclient'
    'libnl'
    'libpulse'
    'libsigc++'
    'libwireplumber'
    'libxkbcommon'
    'playerctl'
    'sndio'
    'spdlog'
    'upower'
    'wayland'
)
makedepends=(
    'catch2'
    'cmake'
    'git'
    'glib2-devel' # gdbus-codegen
    'meson'
    'python-setuptools'
    'scdoc' # to generate manpages
    'wayland-protocols'
)
optdepends=(
    'otf-font-awesome: Icons in the default configuration'
)

if [[ "${_with_cava::1}" == "t" ]]; then
    depends+=('libcava')
fi

if [[ "${_with_gpsd::1}" == "t" ]]; then
    depends+=('gpsd')
fi

conflicts=("$_pkgname" "$_pkgname-git")
provides=("$pkgname=${pkgver%.g*}")

backup=(
    etc/xdg/waybar/config.jsonc
    etc/xdg/waybar/style.css
)

_pkgsrc="$pkgname"
source=("$_pkgsrc::git+$url#branch=temperature-fan-power")
sha256sums=('SKIP')

build() {
    local _meson_args=(
        -Dexperimental=true
    )

    if [[ "${_with_cava::1}" != "t" ]]; then
        _meson_args+=(-Dcava=disabled)
    fi

    if [[ "${_with_gpsd::1}" != "t" ]]; then
        _meson_args+=(-Dgps=disabled)
    fi

    if ((!CHECKFUNC)); then
        _meson_args+=(-Dtests=disabled)
    fi

    arch-meson "${_meson_args[@]}" "$_pkgsrc" build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs --no-rebuild --suite waybar
}

package() {
    if [[ "${_use_sodeps::1}" == "t" ]]; then
        eval "depends+=(
            'libatkmm-1.6.so'
            'libcairomm-1.0.so'
            'libfmt.so'
            'libgtk-3.so'
            'libjack.so'
            'libjsoncpp.so'
            'libpipewire-0.3.so'
            'libsndio.so'
            'libspdlog.so'
            'libudev.so'
            'libupower-glib.so'
        )"
    fi


    meson install -C build --destdir "$pkgdir"
    install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
