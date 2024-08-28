# Maintainer:

_pkgname="xwayland-run"
pkgname="$_pkgname-git"
pkgver=0.0.4.r2.g2a27815
pkgrel=2
pkgdesc="Utilities to run headless X/Wayland clients"
url="https://gitlab.freedesktop.org/ofourdan/xwayland-run"
license=('GPL-2.0-or-later')
arch=('any')

depends=(
  'python'
)
makedepends=(
  'git'
  'meson'
)
optdepends=(
  'cage: Wayland compositor (no headless)'
  'kwin: Wayland compositor'
  'mutter: Wayland compositor'
  'weston: Wayland compositor'
  'xorg-xwayland: X11 server'
  'xorg-xauth: to run X11 clients'
)

provides=(
  "wlheadless-run=${pkgver%%.r*}"
  "xwayland-run=${pkgver%%.r*}"
  "xwfb-run=${pkgver%%.r*}"
)
conflicts=(
  'wlheadless-run'
  'xwayland-run'
  'xwfb-run'
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
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
