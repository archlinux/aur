# Maintainer: Alexis Rouillard <contact@arouillard.fr>

## options
: ${_use_sodeps:=false}

: ${_with_cava:=false}
: ${_with_gpsd:=false}

_pkgname="waybar"
pkgname="$_pkgname-git"
pkgver=0.13.0.r41.g0776e69
pkgrel=1
pkgdesc="Highly customizable Wayland bar for Sway and Wlroots based compositors"
url='https://github.com/Alexays/Waybar'
license=('MIT')
arch=('x86_64')

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
  depends+=('libcava') # AUR
fi
if [[ "${_with_gpsd::1}" == "t" ]]; then
  depends+=('gpsd')
fi

provides=("$_pkgname=${pkgver%.g*}")
conflicts=("$_pkgname")

backup=(
  'etc/xdg/waybar/config.jsonc'
  'etc/xdg/waybar/style.css'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _meson_args=(
    -Dexperimental=true
  )

  if [ "${_with_cava::1}" != "t" ]; then
    _meson_args+=(-Dcava=disabled)
  fi

  if [ "${_with_gpsd::1}" != "t" ]; then
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
