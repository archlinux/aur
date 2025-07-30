# Maintainer: ilovemikael <itsmeguys2247@gmail.com>

# PKGBUILD 'forked' from [https://aur.archlinux.org/packages/waybar-git] by
# Maintainer: Alexis Rouillard <contact@arouillard.fr>
_pkgname="waybar"
pkgname="$_pkgname-minimal-git"
pkgver=0.13.0.r41.g0776e69
pkgrel=1
pkgdesc="Highly customizable bar for Sway, wlroots-based, and other Wayland compositors; PKGBUILD tweaked minutely to eliminate (potentially) unnecessary dependency on gpsd."
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
    -Dgps=disabled
    -Dcava=disabled
  )
  if ((!"${CHECKFUNC:-0}")); then
    _meson_args+=(-Dtests=disabled)
  fi
  arch-meson "${_meson_args[@]}" "$_pkgsrc" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
