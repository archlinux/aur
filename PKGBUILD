# Maintainer:

## options
: ${_build_git:=true}

[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname="xwayland-run"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=0.0.2.r2.g0f30bf5
pkgrel=3
pkgdesc="xvfb-run substitute for wayland"
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
  'cage: Wayland compositor'
  'mutter: Wayland compositor'
  'weston: Wayland compositor'
  'xorg-server-xwayland: X11 server'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
