# Maintainer:

## options
: ${_build_git:=true}

[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname="xwayland-run"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=0.0.2.r3.gc5846bed
pkgrel=1
pkgdesc="Utilities to run headless X/Wayland clients"
url="https://gitlab.freedesktop.org/ofourdan/xwayland-run"
license=('GPL-2.0-or-later')
arch=(x86_64)

depends=(
  python
)
makedepends=(
  git
  meson
)
optdepends=(
  'cage: Wayland compositor (no headless)'
  'kwin: Wayland compositor'
  'mutter: Wayland compositor'
  'weston: Wayland compositor'
  'xorg-server-xwayland: X11 server'
)

provides=(
  "wlheadless-run=${pkgver%%.r*}"
  "xwfb-run=${pkgver%%.r*}"
)
conflicts=(
  'wlheadless-run'
  'xwfb-run'
)

if [[ "${_build_git::1}" == "t" ]] ; then
  provides+=("xwayland-run=${pkgver%%.r*}")
  conflicts+=('xwayland-run')
fi

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
